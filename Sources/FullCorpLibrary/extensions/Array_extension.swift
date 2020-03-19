//
//  Array_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/7/17.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation
import CoreData

extension Array {
    func insert(separator: Element) -> [Element] {
        if count > 0 {
            return (0 ..< 2 * count - 1).map { $0 % 2 == 0 ? self[$0/2] : separator }
        } else {
            return []
        }
    }
    
    mutating func moveElement(fromIndex: Int, toIndex: Int) {
        insert(remove(at: fromIndex), at: toIndex)
    }
}

extension Array where Element: UIView {
    func insertSeparator(_ direction: NSLayoutConstraint.Axis, thickness: CGFloat) -> [Element] {
        if count > 0 {
            var array = [Element]()
            for i in 0 ..< 2 * count - 1 {
                if i % 2 == 0 {
                    array.append(self[i/2])
                } else {
                    array.append(UIView.separatorMake(direction, thickness: thickness) as! Element)
                }
            }
            return array
        } else {
            return []
        }
    }
}

extension Array where Element: Equatable {
    var unique: [Element] {
        var uniqueValues = [Element]()
        forEach { item in
            if !uniqueValues.contains(item) {
                uniqueValues += [item]
            }
        }
        return uniqueValues
    }
}


extension Array where Element: DeviceDetail {
    var euinwkEndpointList: [[String: Any]] {
        return compactMap{ (deviceDetail) -> [String: Any]? in
            guard let deviceMac = deviceDetail.macAddresss, let endpointStr = deviceDetail.endpoint, let endpoint = Int(endpointStr) else { return nil }
            return [
                Key.device.euinwk: deviceMac,
                Key.device.endpoint: endpoint
            ]
        }
    }
}

extension Array where Element: NSManagedObject {
    
    /** return whether anything is removed */
    func removeExcept(_ arrayToKeep: [Element], context: NSManagedObjectContext = MocUtils.moc, saveContext: Bool) -> Bool {
        var isUpdated = false
        filter{!arrayToKeep.contains($0)}.forEach{
            context.delete($0)
            isUpdated = true
        }
        if isUpdated {
            if saveContext {
                do {
                    try context.save()
                } catch {
                    print("error saving context: \(error.localizedDescription)")
                }
            }
            return true
        }
        return false
    }
}
