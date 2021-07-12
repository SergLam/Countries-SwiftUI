//
//  UNAuthorizationStatus+Ext.swift
//  CountriesSwiftUI
//
//  Created by Serhii Liamtsev on 7/12/21.
//  Copyright © 2021 Serhii Liamtsev. All rights reserved.
//

import UserNotifications

extension UNAuthorizationStatus {
    
    var map: Permission.Status {
        switch self {
        case .denied:
            return .denied
        case .authorized:
            return .granted
        case .notDetermined, .provisional, .ephemeral:
            return .notRequested
        @unknown default:
            return .notRequested
        }
    }
}
