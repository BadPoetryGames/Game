// This file is supposed to contain code to make the data model accessible in a package...

import CoreData

class CoreDataManager: NSPersistentContainer {
    
    init() {
        guard let url = Bundle.main.url(forResource: Model.game,
                                        withExtension: Model.ext),
              let model = NSManagedObjectModel(contentsOf: url) else {
            fatalError(" #D Failed to retrieve the object model.")
        }
        
        super.init(name: Model.game, managedObjectModel: model)
        self.initialize()
    }
    
    func initialize() {
        self.loadPersistentStores { description, error in
            if let err = error {
                fatalError(" #D Failed to load CoreData: \(err)")
            }
            
            print(" #D Core data loaded: \(description)")
        }
    }
    
//    func save(entity: CharacterEntity) throws {
//        self.viewContext.insert(entity)
//    }
//
//    func getEntities<T: NSManagedObject>() -> [T] {
//
//    }
}

class ModelManager: ObservableObject {
    
    let coreData: CoreDataManager
    
    @Published private(set) var characters: [CharacterEntity]
    
    convenience init() throws {
        try self.init(coreDataManager: CoreDataManager())
    }
    
    init(manager: CoreDataManager) throws {
        self.coreData = manager
//        self.characters = try self.coreData.getEntities<Character>().map { CharacterEntity(from: $0) }
    }
    
    func save(_ character: CharacterEntity) throws {
//        let entity = Character
//        try self.coreData.save(entity: entity)
//        try refresh()
    }
    
    func refresh() throws {
//        self.characters = try self.coreData.getEntities<Character>().map { CharacterEntity(from: $0) }
    }
}

//extension CharacterEntity {
//    init(from: Character) {
//
//    }
//}

//extension Character {
//    init(from: CharacterEntity) {
//        
//    }
//}
