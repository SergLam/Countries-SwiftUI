//
//  NSManagedObjectContext+Ext.swift
//  CountriesSwiftUI
//
//  Created by Serhii Liamtsev on 7/12/21.
//  Copyright © 2021 Alexey Naumov. All rights reserved.
//

import CoreData

extension NSManagedObjectContext {
    
    func configureAsReadOnlyContext() {
        automaticallyMergesChangesFromParent = true
        mergePolicy = NSRollbackMergePolicy
        undoManager = nil
        shouldDeleteInaccessibleFaults = true
    }
    
    func configureAsUpdateContext() {
        mergePolicy = NSOverwriteMergePolicy
        undoManager = nil
    }
}
