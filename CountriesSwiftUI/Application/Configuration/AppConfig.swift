//
//  AppConfig.swift
//  CountriesSwiftUI
//
//  Created by Serhii Liamtsev on 7/12/21.
//  Copyright © 2021 Serhii Liamtsev. All rights reserved.
//

import Foundation

private enum UserDefinedKeys: String, CaseIterable {
    
    // MARK: - Base URL keys
    case COUNTRY_REST_API_BASE_URL = "COUNTRY_REST_API_BASE_URL"
    case IMAGES_BASE_URL = "IMAGES_BASE_URL"
    case BACKEND_REST_BASE_URL = "BACKEND_REST_BASE_URL"
}

 enum AppConfig {
    
    private static let dictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            preconditionFailure("Plist file not found")
        }
        return dict
    }()
    
    static let bundleId: String = {
        guard let bundleId = Bundle.main.bundleIdentifier else {
            preconditionFailure("Unable to get bundle id")
        }
        return bundleId
    }()
    
    static let appVersion: String = {
        guard let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            preconditionFailure("Unable to get app version number")
        }
        return appVersion
    }()
    
    static let appBuildNumber: String = {
        guard let buildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else {
            preconditionFailure("Unable to get app build number")
        }
        return buildNumber
    }()
    
    // MARK: Base URL
    static let countriesRestBaseURL: URL = {
        guard let rootURLstring = AppConfig.dictionary[UserDefinedKeys.COUNTRY_REST_API_BASE_URL.rawValue] as? String else {
            preconditionFailure("URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            preconditionFailure("URL is invalid")
        }
        return url
    }()
    
    static let imagesBaseURL: URL = {
        guard let rootURLstring = AppConfig.dictionary[UserDefinedKeys.IMAGES_BASE_URL.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            preconditionFailure("URL is invalid")
        }
        return url
    }()
    
    static let backendRestBaseURL: URL = {
        guard let rootURLstring = AppConfig.dictionary[UserDefinedKeys.BACKEND_REST_BASE_URL.rawValue] as? String else {
            preconditionFailure("String not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            preconditionFailure("URL is invalid")
        }
        return url
    }()
    
    // MARK: - Mock API flag
    static var isMockApi: Bool {
        guard let arg = ProcessInfo.processInfo.environment["MOCK_API"] else {
            return false
        }
        return arg == "true"
    }
    
    static var isMockApiStubSuccess: Bool {
        guard let arg = ProcessInfo.processInfo.environment["MOCK_API_SUCCESS"] else {
            return true
        }
        return arg == "true"
    }
    
}
