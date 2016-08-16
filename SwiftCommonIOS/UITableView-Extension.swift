/**
 # UITableView-Extension.swift
##
 
 - Author: Andrew Bradnan
 - Date: 8/16/16
 - Copyright: 
 */

import UIKit

extension UITableView {
    public func mergeData<T: Hashable>(new: [T], old: [T]) {
        /**
         1. Delete sections
         2. Delete rows
         3. Reload sections
         4. Reload rows
         5. Insert sections
         6. Insert rows
         */
        
        self.beginUpdates()
        
        let newSet = Set<T>(new)
        assert(new.count == newSet.count)
        
        let oldSet = Set<T>(old)
        assert(oldSet.count == old.count)
        
        let added = newSet.subtract(oldSet)
        let removed = oldSet.subtract(newSet)
        
        let removedRows = findIndexes(removed, array: old).sort{ $0.row > $1.row }
        let addedRows = findIndexes(added, array: new).sort{ $0.row < $1.row }
        
        self.deleteRowsAtIndexPaths(removedRows, withRowAnimation: .Top)
        self.insertRowsAtIndexPaths(addedRows, withRowAnimation: .Top)
        
        self.endUpdates()
    }
}

func findIndexes<T>(set: Set<T>, array: [T]) -> [NSIndexPath] {
    return set.flatMap{ ssid in
        if let idx = array.indexOf(ssid) {
            return NSIndexPath(forRow: idx, inSection: 0)
        }
        else {
            return nil
        }
    }
}
