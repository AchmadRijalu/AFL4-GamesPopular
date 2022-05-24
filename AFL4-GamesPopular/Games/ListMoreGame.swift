//
//  ListMoreGame.swift
//  GamesPopular
//
//  Created by Macbook Pro on 18/05/22.
//

import SwiftUI


struct URLImageMore:View{
    
    let urlstring:String
    
    @State var data:Data?
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage).resizable().aspectRatio(contentMode: .fill).frame(width: 180, height: 130)
                .background(.white)
        }
        else{
            Image(systemName: "video").resizable().frame(width: 130, height: 70).aspectRatio(contentMode: .fit)
                .background(.gray).onAppear{
                    fetchdata()
                }
        }
    }
    
    private func fetchdata(){
        guard let url = URL(string: urlstring) else{
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data, _ , _ in
            self.data = data
        }
        task.resume()
    }
}


struct ListMoreGame: View {

    @StateObject var viewModelSteamAll = ViewModelSteamAll()
    
    var ang:Int = 1
    
    private let gridmodel = [GridItem(.adaptive(minimum: 170))]
    
    @State var bottomleft:CGFloat = 0
    @State var bottomright:CGFloat = 0
    @State var selection: Int? = nil
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: gridmodel,spacing: 20){
                        ForEach(filteredNames, id: \.self){
                            game in
                            if game.storeID == "1"{
                                VStack{
                                    ZStack(alignment: .bottomLeading){
                                        URLImageMore(urlstring: game.thumb)
                                        Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading)
                                            .overlay(Text((game.savings).prefix(2) + "$ OFF").foregroundColor(.white).bold())
                                        }
                                    .cornerRadius(3)
                                    VStack{
                                        Text(game.title)
                                            .bold()
                                        Spacer()
                                        Button("Add to Wishlist"){
                                            
                                        }.background(.white).frame(height: 55).buttonStyle(.bordered)
                                        
                                    }.frame(width:180,height: 100)
                                        .background(.white)
                                    
                                }
                                .border(Color.gray)
                                .cornerRadius(10)
                            }
                            else{
                                
                            }
                        }
                    }
                .searchable(text: $searchText, prompt: "Cari")
                .onAppear{
                        viewModelSteamAll.fetch()
                    }
                    
            }
        }
        
        .onAppear{
            viewModelSteamAll.fetch()
        }.navigationBarTitle("Game List")
}
    
    //SEARCH TEXT VARIABLE
    var filteredNames:[Game]{
        if searchText.isEmpty{
            return viewModelSteamAll.games
        }
        else{

            return viewModelSteamAll.games.filter{

                $0.title.localizedStandardContains(searchText)
            }
        }
    }
    
struct ListMoreGame_Previews: PreviewProvider {
    static var previews: some View {
        ListMoreGame()
    }
}
}

