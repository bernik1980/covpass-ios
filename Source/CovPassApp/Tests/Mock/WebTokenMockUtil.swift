//
//  WebTokenMockUtil.swift
//
//  © Copyright IBM Deutschland GmbH 2021
//  SPDX-License-Identifier: Apache-2.0
//

import CovPassCommon
import Foundation

extension CBORWebToken {
    func mockName(_ name: Name) -> Self {
        var token = self
        token.hcert.dgc.nam = name
        return token
    }
    
    func mockVaccinationUVCI(_ uvci: String) -> Self {
        hcert.dgc.v?.first?.ci = uvci
        return self
    }
    
    func mockTestUVCI(_ uvci: String) -> Self {
        hcert.dgc.t?.first?.ci = uvci
        return self
    }

    func mockVaccinationSetDate(_ date: Date) -> Self {
        hcert.dgc.v?.first?.dt = date
        return self
    }

    func extended(vaccinationQRCodeData: String = "") -> ExtendedCBORWebToken {
        ExtendedCBORWebToken(vaccinationCertificate: self,
                             vaccinationQRCodeData: vaccinationQRCodeData)
    }
}
