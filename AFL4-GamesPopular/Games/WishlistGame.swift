//
//  WishlistGame.swift
//  AFL4-GamesPopular
//
//  Created by Macbook Pro on 24/05/22.
//

import SwiftUI


struct URLImage2:View{
    
    let urlstring:String
    
    @State var data:Data?
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data){
            Image(uiImage: uiimage).resizable()
                .aspectRatio(contentMode: .fit)
                .layoutPriority(1)
        }
        else{
            Image(systemName: "video").resizable().aspectRatio(contentMode: .fit)
                .layoutPriority(1).background(.gray)
                .onAppear{
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


struct WishlistGame: View {
    @EnvironmentObject var favourites:Favourites
    
    var body: some View {
        VStack(alignment: .leading){
            
            
            NavigationView{
                List{
                    ForEach(favourites.dataarray, id: \.self){
                        game in
                        HStack{
                            VStack{
                            HStack{
                                VStack{
                                    
                                        URLImage2(urlstring: game.thumb)
                                }.background(.white).frame(width: 100)
                                Text(game.title).bold()
                                Spacer()
                                VStack{
                                    Button(favourites.contains(game) ? "Remove" : "Add to wishlist"){
                                        if favourites.contains(game){
                                            if let index = favourites.dataarray.firstIndex(of: game) {
                                                favourites.dataarray.remove(at: index)
                                            }
                                        }
                                        else{
                                            favourites.add(game)
                                        }
                                    }.tint(.red)
                                        .controlSize(.regular)
                                        .buttonStyle(.borderedProminent)
                                }
                            }
                            
                            }
                        }.padding(3)
                        
                    }
                }.navigationTitle("Wishlist")
                Divider()
        }
    }
}

struct WishlistGame_Previews: PreviewProvider {
    static var previews: some View {
        WishlistGame().environmentObject(Favourites())
    }
}
}
