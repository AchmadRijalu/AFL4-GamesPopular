//
import SwiftUI
import Foundation


//struct Course:Hashable, Codable{
//
//    let title:String
//    let thumb:String
//}




struct ContentView: View {
    
    
    
    
    @AppStorage("darkModeEnabled") private var darkmodeEnabled = false
    @AppStorage("systemThemeEnabled") private var systemThemeEnabled = false
    var body: some View {
        TabView{
            ListGame().tabItem{
                Image(systemName: "house")
                Text("Home")
            }
            
            WishlistGame().tabItem{
                Image(systemName: "gamecontroller")
                Text("Wishlist")
            }
            
            ProfileView(darkModeEnabled: $darkmodeEnabled, systemThemeEnabled: $systemThemeEnabled).tabItem{
                Image(systemName: "person")
                Text("Profile")
                
            }
        }.onAppear{
            SystemThemeManager.shared.handleTheme(darkMode: darkmodeEnabled, system: systemThemeEnabled)
        }
        
    
    }
       
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
