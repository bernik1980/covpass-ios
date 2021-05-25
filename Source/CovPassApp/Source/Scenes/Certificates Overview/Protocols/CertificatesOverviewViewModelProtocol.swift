//
//  CertificatesOverviewViewModelProtocol.swift
//
//
//  © Copyright IBM Deutschland GmbH 2021
//  SPDX-License-Identifier: Apache-2.0
//

import CovPassCommon
import CovPassUI
import PromiseKit
import UIKit

protocol CertificatesOverviewViewModelProtocol {
    var delegate: CertificatesOverviewViewModelDelegate? { get set }
    var certificateViewModels: [CardViewModel] { get }

    func refresh()
    func scanCertificate(withIntroduction: Bool)
    func showAppInformation()
    func showErrorDialog()
}

extension CertificatesOverviewViewModelProtocol {
    func scanCertificate() {
        scanCertificate(withIntroduction: true)
    }
}
