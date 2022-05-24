//
import SwiftUI
import Foundation


//struct Course:Hashable, Codable{
//
//    let title:String
//    let thumb:String
//}




struct ContentView: View {
    
    @StateObject private var model = DataState()
    
    var body: some View {
        TabView{
            ListGame().environmentObject(model).tabItem{
                Image(systemName: "house")
                Text("Home")
            }
            
            WishlistGame().tabItem{
                Image(systemName: "gamecontroller")
                Text("Wishlist")
            }
            
            ProfileView().tabItem{
                Image(systemName: "person")
                Text("Profile")
                
            }
        }
        
    
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
