//
//  NSManagedObject_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/9/6.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation
import CoreData

extension NSManagedObject {
    class func deleteAll(context: NSManagedObjectContext, saveContext: Bool) {
        do {
            guard
                let results = try context.fetch(fetchRequest()) as? [NSManagedObject],
                results.count > 0
            else {
                return
            }
            
            results.forEach{context.delete($0)}
            if saveContext {
                try context.save()
            }
            
        } catch {
            print("Error Deleting All: \(error.localizedDescription)")
        }
    }
}
