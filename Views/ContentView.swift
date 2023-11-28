import SwiftUi 
import CoreData

struct ContentView: View {

    @Environment(\.managedObjContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var account: FetchResults<Account>

    @State private var showingAddView = false



    


    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
               List {
                ForEach(account){ account in
                 
                 HStack{
                    VStack(alignment: .leading, spacing: 6){
                        Text(account.name!)
                        .bold()

                        Text(account.password!)
                    }
                    Spacer()
                    Text(calcTimeSince(date: account.date!))
                    .foreGroundColor(.gray)\
                    .Italic()
                 }
                
                }
               }
               .listStyle(.plain)
            }
            .navigationTitle("Accounts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showingAddView.toggle()
                    } label : {
                        Label("Add Account" , systemImage: "plus.circle")
                    }
                }
                ToolbarItem(placement: .navigationBarLeading){
                    EditButon()
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddAccountView()
            }
        }
        navigationViewStyle(.stack)
        }

        private func deleteAccount(offsets: IndexSet) {
            

            withAnimation{
                offsets.map {account[$0] }.ForEach(managedObjContext.delete)

                DataController().save(context: managedObjContext)
            }

           

        }
        
    }

      
}

struct ContentView_Previews: PreviewProvider{
static var previews: some View {
    ContentView()
}
}