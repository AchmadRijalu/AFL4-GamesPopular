//
//  ListMoreGame.swift
//  GamesPopular
//
//  Created by Macbook Pro on 18/05/22.
//

import SwiftUI


struct URLImageMore:View{
    @State var showSettingsView = false
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
    @EnvironmentObject var index: GameIndex
    
    @StateObject var viewModelSteamAll = ViewModelSteamAll()
    @StateObject var viewModelGamersGateAll = ViewModelGamersGateAll()
    @StateObject var viewModelEpicGameAll = ViewModelEpicGameAll()
    @StateObject var viewModelOriginAll = ViewModelOriginAll()
    @StateObject var viewModelGamePlanetAll = ViewModelGamePlanetAll()
    
    var gindex:Int
    
    private let gridmodel = [GridItem(.adaptive(minimum: 170))]
    
    @State var bottomleft:CGFloat = 0
    @State var bottomright:CGFloat = 0
    @State var selection: Int? = nil
    @State private var searchText = ""
    
    var body: some View {
//        HStack{
//            Text("Game List").font(.largeTitle).bold().padding(5)
//            Spacer()
//        }
        ScrollView {
            VStack{
                ScrollView{
                    if gindex == 1{
                        LazyVGrid(columns: gridmodel,spacing: 20){
                            ForEach(filteredNamesteam, id: \.self){
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
                                            Text(game.title).foregroundColor(Theme.textColor)
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
                    else if gindex == 2{
                        LazyVGrid(columns: gridmodel,spacing: 20){
                            ForEach(filteredNameGamersGate, id: \.self){
                                game in
                                if game.storeID == "2"{
                                    VStack{
                                        ZStack(alignment: .bottomLeading){
                                            URLImageMore(urlstring: game.thumb)
                                            Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading)
                                                .overlay(Text((game.savings).prefix(2) + "$ OFF").foregroundColor(.white).bold())
                                        }
                                        .cornerRadius(3)
                                        VStack{
                                            Text(game.title).foregroundColor(Theme.textColor)
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
                            viewModelGamersGateAll.fetch()
                        }

                    }
                    else if gindex == 3{
                        LazyVGrid(columns: gridmodel,spacing: 20){
                            ForEach(filteredNameEpicGame, id: \.self){
                                game in
                                if game.storeID == "25"{
                                    VStack{
                                        ZStack(alignment: .bottomLeading){
                                            URLImageMore(urlstring: game.thumb)
                                            Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading)
                                                .overlay(Text((game.savings).prefix(2) + "$ OFF").foregroundColor(.white).bold())
                                        }
                                        .cornerRadius(3)
                                        VStack{
                                            Text(game.title).foregroundColor(Theme.textColor)
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
                            viewModelEpicGameAll.fetch()
                        }
                    }
                    else if gindex == 4{
                        LazyVGrid(columns: gridmodel,spacing: 20){
                            ForEach(filteredNameOrigin, id: \.self){
                                game in
                                if game.storeID == "8"{
                                    VStack{
                                        ZStack(alignment: .bottomLeading){
                                            URLImageMore(urlstring: game.thumb)
                                            Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading)
                                                .overlay(Text((game.savings).prefix(2) + "$ OFF").foregroundColor(.white).bold())
                                        }
                                        .cornerRadius(3)
                                        VStack{
                                            Text(game.title).foregroundColor(Theme.textColor)
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
                            viewModelOriginAll.fetch()
                        }
                    }
                    else if gindex == 5{
                        LazyVGrid(columns: gridmodel,spacing: 20){
                            ForEach(filteredNameGamePlanet, id: \.self){
                                game in
                                if game.storeID == "27"{
                                    VStack{
                                        ZStack(alignment: .bottomLeading){
                                            URLImageMore(urlstring: game.thumb)
                                            Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading)
                                                .overlay(Text((game.savings).prefix(2) + "$ OFF").foregroundColor(.white).bold())
                                        }
                                        .cornerRadius(3)
                                        VStack{
                                            Text(game.title).foregroundColor(Theme.textColor)
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
                            viewModelGamePlanetAll.fetch()
                        }
                    }
                }.padding(5)
            }.navigationBarTitle("Game List")
            
        }
    }
    
    //SEARCH TEXT VARIABLE
    var filteredNamesteam:[Game]{
        if searchText.isEmpty{
            return viewModelSteamAll.games
           
        }
        else{
            
            return viewModelSteamAll.games.filter{
                
                $0.title.localizedStandardContains(searchText)
            }
        }
    }
    var filteredNameGamersGate:[Game]{
        if searchText.isEmpty{
            return viewModelGamersGateAll.games
           
        }
        else{
            
            return viewModelGamersGateAll.games.filter{
                
                $0.title.localizedStandardContains(searchText)
            }
        }
    }

    var filteredNameEpicGame:[Game]{
        if searchText.isEmpty{
            return viewModelEpicGameAll.games
           
        }
        else{
            
            return viewModelEpicGameAll.games.filter{
                
                $0.title.localizedStandardContains(searchText)
            }
        }
    }

    var filteredNameOrigin:[Game]{
        if searchText.isEmpty{
            return viewModelOriginAll.games
           
        }
        else{
            
            return viewModelOriginAll.games.filter{
                
                $0.title.localizedStandardContains(searchText)
            }
        }
    }

    var filteredNameGamePlanet:[Game]{
        if searchText.isEmpty{
            return viewModelGamePlanetAll.games
           
        }
        else{
            
            return viewModelGamePlanetAll.games.filter{
                
                $0.title.localizedStandardContains(searchText)
            }
        }
    }

    
    struct ListMoreGame_Previews: PreviewProvider {
        static var previews: some View {
            ListMoreGame(gindex: Int())
        }
    }

}
