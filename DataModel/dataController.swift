import Foundation
import CoreData

class dataController: ObservableObject{
    let container  = NSPeresistentContainer(name: "ModelName")

    init(){
        container.loadPersistentStores {desc, error in
        if let error = error {
            print("Failed to load the data \(error.localizedDescription)")
        }
        }
    }


   func save(context: NSManagedObjectContext){
    do {
        try context.save()
        print("Data saved")
    } catch {
        print("We can NOT save data...")
    }

   }

   func addAccount(name: String, password: String, context: NSManagedObjectContext){
    
    let account = Account(context:context)
    account.id = UUID()
    account.data = Date()
    account.name = name
    account.password = password
    
    save(context:context)

   }

   func editAccount(account: Account, name: String, password: String, context:NSManagedObjectContext){
    account.date = date()
    account.name = name
    account.password = password

    save(context:context)
   }

}