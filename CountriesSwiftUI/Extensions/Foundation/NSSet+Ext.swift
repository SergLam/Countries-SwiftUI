//
//  NSSet+Ext.swift
//  CountriesSwiftUI
//
//  Created by Serhii Liamtsev on 7/12/21.
//  Copyright © 2021 Alexey Naumov. All rights reserved.
//

import Foundation

extension NSSet {
    func toArray<T>(of type: T.Type) -> [T] {
        allObjects.compactMap { $0 as? T }
    }
}
