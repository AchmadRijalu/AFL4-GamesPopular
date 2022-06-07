//
//  ListGame.swift
//  GamesPopular
//
//  Created by Macbook Pro on 07/05/22.
//

import SwiftUI



struct URLImage:View{
    
    let urlstring:String
    
    @State var data:Data?
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage).resizable().aspectRatio(contentMode: .fill).frame(width: 170, height: 90).scaledToFit()
                .background(.white)
        }
        else{
            Image(systemName: "video").resizable().frame(width: 170, height: 90).aspectRatio(contentMode: .fit)
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

struct ListGame: View {
    

    @StateObject var viewModel = ViewModel()
    @StateObject var viewModelSteamSorted = ViewModelSteamSorted()
    @StateObject var viewModelGamersGateSorted = ViewModelGamersGateSorted()
    @StateObject var viewModelEpicGamesSorted = ViewModelEpicGamesSorted()
    @StateObject var viewModelOriginSorted = ViewModelOriginSorted()
    @StateObject var viewModelGamePlanetSorted = ViewModelGamePlanetSorted()
    @State private var searchText = ""
    
    
    @State private var isShowedHeader:Int? = 0
    private let gridmodel = [GridItem(.adaptive(minimum: 170))]
    
    @EnvironmentObject var favourites:Favourites
    
    
    @State var bottomleft:CGFloat = 0
    @State var bottomright:CGFloat = 0
    @State var selection: Int? = nil
    
    var body: some View {
        VStack{
            VStack(alignment:.leading){
                Text("👋 Anbu!")
                    .padding(.horizontal,15)
                Header()
            }
            
            Divider()
            Spacer()
            NavigationView{
                
                ScrollView{
                    VStack{
                    //STEAM
                    VStack{
                        HStack{
                            Image("steam").resizable().frame(width: 25, height: 25)
                            
                            Text("Steam Store").font(.system(size: 22)).bold()
                            Spacer()
                            NavigationLink(destination: ListMoreGame(gindex: 1)) {
                                Text("More").foregroundColor(.blue)
                            }
                            
                            
                        }
                        LazyVGrid(columns: gridmodel,spacing: 20){
                            ForEach(viewModelSteamSorted.games, id: \.self){
                                game in
                                VStack{
                                    VStack{
                                        ZStack(alignment: .bottomLeading){
                                            URLImage(urlstring: game.thumb)
                                            Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading)
                                                .overlay(Text((game.savings).prefix(2) + "$ OFF").foregroundColor(.white).bold())
                                            
                                        }
                                    }.frame(height: 90)
                                    .cornerRadius(3)
                                    VStack{
                                        Text(game.title).foregroundColor(Theme.textColor)
                                            .bold()
                                        Spacer()
                                        Button(favourites.contains(game) ? "Remove from wishlist" : "Add to wishlist"){
                                            if favourites.contains(game){
                                                if let index = favourites.dataarray.firstIndex(of: game) {
                                                    favourites.dataarray.remove(at: index)
                                                }
                                            }
                                            else{
                                                favourites.add(game)
                                            }
                                        }.buttonStyle(.borderedProminent)
                                            .padding()
                                        Spacer()
                                        
                                    }.padding(8).frame(width:190,height: 100)
                                        .background(.white)
                                    
                                }
                                .border(Color.gray).shadow(color: .gray, radius: 4, x: 4, y: 4)
                                .cornerRadius(10)
                                
                            }
                        }
                        //                                .searchable(text: $searchText, prompt: "Cari")
                        .onAppear{viewModelSteamSorted.fetch()
                        }
                    }
                    .padding(.bottom ,30)
                }
                //GAMERSGATE
                VStack{
                    HStack{
                        Image("gamersgate").resizable().frame(width: 29, height: 29)
                        
                        Text("GamersGate Store").font(.system(size: 22)).bold()
                        
                        Spacer()
                        NavigationLink(destination: ListMoreGame(gindex:2)) {
                            Text("More").padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(.blue)
                        }
                    }.padding(.bottom, 23)
                    
                    LazyVGrid(columns: gridmodel,spacing: 20){
                        ForEach(viewModelGamersGateSorted.games, id: \.self){
                            game in
                            VStack{
                                VStack{
                                    ZStack(alignment: .bottomLeading){
                                        URLImage(urlstring: game.thumb)
                                        Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading)
                                            .overlay(Text((game.savings).prefix(2) + "$ OFF").foregroundColor(.white).bold())
                                        
                                    }
                                }.frame(height: 90)
                                .cornerRadius(3)
                                VStack{
                                    Text(game.title).foregroundColor(Theme.textColor)

                                        .bold()
                                    Spacer()
                                    Button(favourites.contains(game) ? "Remove from wishlist" : "Add to wishlist"){
                                        if favourites.contains(game){
                                            if let index = favourites.dataarray.firstIndex(of: game) {
                                                favourites.dataarray.remove(at: index)
                                            }
                                        }
                                        else{
                                            favourites.add(game)
                                        }
                                    }.buttonStyle(.borderedProminent)
                                        .padding()
                                    
                                }.padding(8).frame(width:190,height: 100)
                                    .background(.white)
                                
                            }
                            .border(Color.gray).shadow(color: .gray, radius: 4, x: 4, y: 4)
                            .cornerRadius(10)
                            
                        }
                    }.onAppear{
                        viewModelGamersGateSorted.fetch()
                    }
                }.padding(.bottom, 30)
                //EPICGAMES
                VStack{
                    HStack{
                        Image("epicgame").resizable().frame(width: 29, height: 29)
                        
                        Text("Epic Games").font(.system(size: 22)).bold()
                        Spacer()
                        NavigationLink(destination: ListMoreGame(gindex:3)) {
                            Text("More").padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(.blue)
//                                .onTapGesture {
//                                    //perform some tasks if needed before opening Destination view
//                                    self.modelHide.pushed = true
//                                }
                        }
                    }
                    
                    LazyVGrid(columns: gridmodel,spacing: 20){
                        ForEach(viewModelEpicGamesSorted.games, id: \.self){
                            game in
                            if game.storeID == "25"{
                                VStack{
                                    VStack{
                                        ZStack(alignment: .bottomLeading){
                                            URLImage(urlstring: game.thumb)
                                            Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading)
                                                .overlay(Text((game.savings).prefix(2) + "$ OFF").foregroundColor(.white).bold())
                                            
                                        }
                                    }.frame(height: 90)
                                    .cornerRadius(3)
                                    VStack{
                                        Text(game.title).foregroundColor(Theme.textColor)

                                            .bold()
                                        Spacer()
//                                        Button("Add to Wishlist"){
//
//                                        }.background(.white).frame(height: 55).buttonStyle(.bordered)
                                        Button(favourites.contains(game) ? "Remove from wishlist" : "Add to wishlist"){
                                            if favourites.contains(game){
                                                if let index = favourites.dataarray.firstIndex(of: game) {
                                                    favourites.dataarray.remove(at: index)
                                                }
                                            }
                                            else{
                                                favourites.add(game)
                                            }
                                        }.buttonStyle(.borderedProminent)
                                            .padding()
                                        
                                    }.padding(8).frame(width:190,height: 100)
                                        .background(.white)
                                    
                                }
                                .border(Color.gray).shadow(color: .gray, radius: 4, x: 4, y: 4)
                                .cornerRadius(10)
                            }
                            else{
                                
                            }
                        }
                    }.onAppear{
                        viewModelEpicGamesSorted.fetch()
                    }
                }.padding(.bottom , 30)
                
                //ORIGIN
                VStack{
                    HStack{
                        Image("origin").resizable().frame(width: 29, height: 29)
                        
                        Text("Origin").font(.system(size: 22)).bold()
                        Spacer()
                        NavigationLink(destination: ListMoreGame(gindex:4)) {
                            Text("More").foregroundColor(.blue)
                        }
                        
//                            .onTapGesture {
//                                //perform some tasks if needed before opening Destination view
//                                self.modelHide.pushed = true
//                            }
                        
                    }.padding(.bottom, 20)

                    LazyVGrid(columns: gridmodel,spacing: 10){
                        ForEach(viewModelOriginSorted.games, id: \.self){
                            game in
                            VStack{
                                VStack{
                                    ZStack(alignment: .bottomLeading){
                                        URLImage(urlstring: game.thumb)
                                        Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading)
                                            .overlay(Text((game.savings).prefix(2) + "$ OFF").foregroundColor(.white).bold())
                                        
                                    }
                                }.frame(height: 90)
                                .cornerRadius(3)
                                    VStack{
                                        Text(game.title).foregroundColor(Theme.textColor)

                                            .bold()
                                        Spacer()
                                        Button(favourites.contains(game) ? "Remove from wishlist" : "Add to wishlist"){
                                            if favourites.contains(game){
                                                if let index = favourites.dataarray.firstIndex(of: game) {
                                                    favourites.dataarray.remove(at: index)
                                                }
                                            }
                                            else{
                                                favourites.add(game)
                                            }
                                        }.buttonStyle(.borderedProminent)
                                            .padding()
                                        
                                    }.padding(8).frame(width:190,height: 100)
                                        .background(.white)
                                    
                                }
                                .border(Color.gray).shadow(color: .gray, radius: 4, x: 4, y: 4)
                                .cornerRadius(10)
                            
                        }
                    }.onAppear{
                        viewModelOriginSorted.fetch()
                    }
                    
                    
                }.padding(.bottom, 30)
                //GAMEPLANET
                HStack{
                    Image("gameplanet").resizable().frame(width: 29, height: 29)
                    
                    Text("GamePlanet").font(.system(size: 22)).bold()
                    Spacer()
                    NavigationLink(destination: ListMoreGame(gindex:5)) {
                        Text("More").padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)).foregroundColor(.blue)
                    }
                    
//                        .onTapGesture {
//                            //perform some tasks if needed before opening Destination view
//                            self.modelHide.pushed = true
//                        }
                        
                }.padding(.bottom, 20)
                LazyVGrid(columns: gridmodel,spacing: 10){
                    ForEach(viewModelGamePlanetSorted.games, id: \.self){
                        game in
                        if game.storeID == "27"{
                            VStack{
                                VStack{
                                    ZStack(alignment: .bottomLeading){
                                        URLImage(urlstring: game.thumb)
                                        Rectangle().fill(Color.red).frame(width: 180, height: 34, alignment: .bottomLeading)
                                            .overlay(Text((game.savings).prefix(2) + "$ OFF").foregroundColor(.white).bold())
                                        
                                    }
                                }
                                .cornerRadius(3)
                                VStack{
                                    Text(game.title).foregroundColor(Theme.textColor)

                                        .bold()
                                    Spacer()
                                    Button(favourites.contains(game) ? "Remove from wishlist" : "Add to wishlist"){
                                        if favourites.contains(game){
                                            if let index = favourites.dataarray.firstIndex(of: game) {
                                                favourites.dataarray.remove(at: index)
                                            }
                                        }
                                        else{
                                            favourites.add(game)
                                        }
                                    }.buttonStyle(.borderedProminent)
                                        .padding()
                                    
                                }.padding(8).frame(width:190,height: 100)
                                    .background(.white)
                                
                            }
                            .border(Color.gray)
                            .cornerRadius(10)
                        }
                        else{
                            
                        }
                    }
                }.onAppear{
                    viewModelGamePlanetSorted.fetch()
                }
                
                
            }.navigationBarHidden(true)
            
        }.padding(15)
        
        
        
        //            }
        
        
    }
    
    
    //SEARCH TEXT VARIABLE
    //    var filteredNames:[Game]{
    //        if searchText.isEmpty{
    //            return viewModel.games
    //        }
    //        else{
    //
    //            return viewModel.games.filter{
    //
    //                $0.title.localizedStandardContains(searchText)
    //            }
    //        }
    //    }
}


struct ListGame_Previews: PreviewProvider {
    static var previews: some View {
        ListGame().environmentObject(Favourites())
    }
}
}
