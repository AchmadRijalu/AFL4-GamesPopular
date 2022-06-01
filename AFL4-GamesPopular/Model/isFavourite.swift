//
//  isFavourite.swift
//  AFL4-GamesPopular
//
//  Created by Macbook Pro on 29/05/22.
//

import Foundation


@MainActor class Favourites:ObservableObject{
//    @Published var manygame:Set<String>
    
    @Published var dataarray:[Game]{
        didSet{
            save()
        }
    }
    
    let savekey:String = "favourites"
    
    init(){
        dataarray = []
        getItems()
    }
    
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: savekey),
              let saveItems = try? JSONDecoder().decode([Game].self, from: data)
        else{ return }
        
        self.dataarray = saveItems
              
    }
    
    
    func contains(_ game:Game)-> Bool{
        dataarray.contains(game)
    }

    func add(_ game:Game){
        objectWillChange.send()

        dataarray.append(game)
//        save()
    }
    
    
//    func remove(_ game:Game){
//        objectWillChange.send()
//
//        manygame.remove(game.internalName)
//        save()
//    }
    
    func save(){
    
        if let encodedData = try? JSONEncoder().encode(dataarray){
            UserDefaults.standard.set(encodedData, forKey: savekey)
        }
    }

}
