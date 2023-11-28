import SwiftUI

struct AddAccountView: View {
   
   @Envronment (\.managedObjectContext) var managedObjectContext 
   @Environment(\.dimiss) var dismiss

   @State private var name = ""
   @State prvate var password = ""




    var body: some View {
              Form{
                Section {
                    TextField("Account Name:", text: $name)

                    VStack{
                        Text("Password:", text: $password)
                    }
                }
              }
    }
}

struct AddAccountView_Previews: PreviewProvider{
    static var previews: some View {
        AddAccountView()
    }
}

