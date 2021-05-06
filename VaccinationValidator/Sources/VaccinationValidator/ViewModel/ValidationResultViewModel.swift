//
//  StartOnboardingViewModel.swift
//
//
//  Copyright © 2021 IBM. All rights reserved.
//

import UIKit
import PromiseKit
import VaccinationCommon
import VaccinationUI

enum Result {
    case full
    case partial
    case error
}

open class ValidationResultViewModel: BaseViewModel {
    public weak var delegate: ViewModelDelegate?
    let router: ValidationResultRouterProtocol
    private let parser: QRCoder = QRCoder()
    private var certificate: CBORWebToken?

    public init(
        router: ValidationResultRouterProtocol,
        certificate: CBORWebToken?) {
        self.router = router
        self.certificate = certificate
    }

    private var result: Result {
        guard let cert = certificate else {
            return .error
        }
        return immunizationState(for: cert.hcert.dgc )
    }

    open var icon: UIImage? {
        switch result {
        case .full:
            return .resultSuccess
        case .partial, .error:
            return .resultError
        }
    }

    open var resultTitle: String {
        switch result {
        case .full:
            return "validation_check_popup_valid_vaccination_title".localized
        case .partial:
            return "validation_check_popup_vaccination_not_completely_title".localized
        case .error:
            return "validation_check_popup_unsuccessful_test_title".localized
        }
    }

    open var resultBody: String {
        switch result {
        case .full:
            return "validation_check_popup_valid_vaccination_message".localized
        case .partial:
            return "validation_check_popup_vaccination_not_completely_message".localized
        case .error:
            return "validation_check_popup_unsuccessful_test_message".localized
        }
    }

    open var nameTitle: String? {
        switch result {
        case .full, .partial:
            return certificate?.hcert.dgc.nam.fullName
        case .error:
            return "validation_check_popup_unsuccessful_test_first_reason_title".localized
        }
    }

    open var nameBody: String? {
        switch result {
        case .full, .partial:
            if let date = certificate?.hcert.dgc.dob {
                return String(format: "%@ %@", "validation_check_popup_partial_valid_vaccination_date_of_birth_at".localized, DateUtils.displayDateFormatter.string(from: date))
            }
            return nil
        case .error:
            return "validation_check_popup_unsuccessful_test_first_reason_body".localized
        }
    }

    open var errorTitle: String? {
        switch result {
        case .full, .partial:
            return ""
        case .error:
            return "validation_check_popup_unsuccessful_test_second_reason_title".localized
        }
    }

    open var errorBody: String? {
        switch result {
        case .full, .partial:
            return ""
        case .error:
            return "validation_check_popup_unsuccessful_test_second_reason_body".localized
        }
    }

    var closeButtonImage: UIImage? {
        .close
    }

    // MARK - PopupRouter

    // TODO Do we really need it here?!
    let height: CGFloat = 650
    let topCornerRadius: CGFloat = 20
    let presentDuration: Double = 0.5
    let dismissDuration: Double = 0.5
    let shouldDismissInteractivelty: Bool = true

    // MARK: - Methods

    func cancel() {
        router.showStart()
    }

    func scanNextCertifcate() {
        firstly {
            router.scanQRCode()
        }
        .map {
            try self.payloadFromScannerResult($0)
        }
        .then {
            self.process(payload: $0)
        }
        .get {
            self.certificate = $0
        }
        .done { _ in
            self.delegate?.viewModelDidUpdate()
        }
        .catch {
            self.delegate?.viewModelUpdateDidFailWithError($0)
        }
    }

    private func process(payload: String) -> Promise<CBORWebToken> {
        return parser.parse(payload)
    }

    // TODO: Needs a common shared place
    private func payloadFromScannerResult(_ result: ScanResult) throws -> String {
        switch result {
        case .success(let payload):
            return payload
        case .failure(let error):
            throw error
        }
    }

    private func immunizationState(for certificate: DigitalGreenCertificate) -> Result {
        let calendar = Calendar.current
        if certificate.fullImmunization,
           let vaccinationDate = certificate.v.last?.dt,
           let validDate = calendar.date(byAdding: .weekOfYear, value: 2, to: vaccinationDate),
           validDate > Date() {
            return .partial
        }
        return certificate.fullImmunization ? .full : .partial
    }
}

