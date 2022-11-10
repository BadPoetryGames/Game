//
//  GamePersistence.swift
//  Model Package
//
//  Created by James Lingo on 11/10/22.
//

import CoreData

public protocol PersistenceManager {
    
    var viewContext: NSManagedObjectContext { get }
    init(configuration: PersistenceConfig)
}

extension PersistenceManager {
    
    static func model(for name: String) -> NSManagedObjectModel {
        
        // TODO: Error handling...
        guard let url = Bundle.module.url(forResource: name, withExtension: "mom") else { fatalError("Could not get URL for model: \(name)") }

        guard let model = NSManagedObjectModel(contentsOf: url) else { fatalError("Could not get model for: \(url)") }

        return model
    }
}

public struct PersistenceConfig {
    public let modelName      : String
    public let cloudIdentifier: String
    public let configuration  : String

    public init(modelName: String, cloudIdentifier: String, configuration: String) {
        self.modelName = modelName
        self.cloudIdentifier = cloudIdentifier
        self.configuration = configuration
    }
}

open class PersistentContainer: NSPersistentContainer {

    override open class func defaultDirectoryURL() -> URL {

        return super.defaultDirectoryURL()
            .appendingPathComponent(Path.model)
            .appendingPathComponent(Path.local)
    }
}

@available(iOS 13.0, *)
open class PersistentCloudKitContainer: NSPersistentCloudKitContainer {
    
    override open class func defaultDirectoryURL() -> URL {
        
        return super.defaultDirectoryURL()
            .appendingPathComponent(Path.model)
            .appendingPathComponent(Path.cloud)
    }
}

public class GamePersistenceManager: PersistenceManager {
    private var container: PersistentContainer
    
    public var viewContext: NSManagedObjectContext { container.viewContext }
    
    public required init(configuration: PersistenceConfig) {
        let model = GamePersistenceManager.model(for: configuration.modelName)
        
        self.container = .init(name: configuration.modelName,
                               managedObjectModel: model)
        
        self.container.persistentStoreDescriptions
            .first?
            .configuration = configuration.configuration
        
        self.container.persistentStoreDescriptions
            .first?
            .type = NSInMemoryStoreType
        
        self.container.loadPersistentStores(completionHandler: { (desc, err) in
            
            // TODO: Error handling...
            if let err = err {
                fatalError("Error loading TEMPORARY STORE: \(desc): \(err)")
            }
            
            debugPrint("Loaded TEMPORARY STORE successfully")
        })
    }
}
