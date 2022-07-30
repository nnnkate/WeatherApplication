//
//  CoreDataManager.swift
//  Weather
//
//  Created by Ekaterina Nedelko on 28.07.22.
//

import Foundation
import CoreData
import UIKit

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    private var errorHandler: (Error) -> Void = {_ in }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Weather")
        container.loadPersistentStores(completionHandler: { [weak self] (storeDescription, error) in
            if let error = error {
                NSLog("CoreData error \(error), \(String(describing: error._userInfo))")
                self?.errorHandler(error)
            }
        })
        return container
    }()
    
    private lazy var viewContext: NSManagedObjectContext = {
        self.persistentContainer.viewContext
    }()

    private init () { }
    
    func saveContext() {
        if self.persistentContainer.viewContext.hasChanges {
            do {
                try self.persistentContainer.viewContext.save()
            } catch {
                NSLog("Error occured while saving persistent store: \(error), \(String(describing: error._userInfo))")
                self.errorHandler(error)
            }
        }
    }
    
    func getContext() -> [City] {
        let fetchRequest = City.fetchRequest() as NSFetchRequest<City>

        do {
            return try viewContext.fetch(fetchRequest)
        } catch let error {
            print(error)
            return [City]()
        }
    }
}
