//
//  isFavourite.swift
//  AFL4-GamesPopular
//
//  Created by Macbook Pro on 29/05/22.
//

import Foundation


@MainActor class Favourites:ObservableObject{
//    @Published var manygame:Set<String>
    
    @Published var dataarray:[Game]
    
    private let savekey = "favourites"
    
    
    init(){
        dataarray = []
    }
    
    func contains(_ game:Game)-> Bool{
        dataarray.contains(game)
    }

    func add(_ game:Game){
        objectWillChange.send()

        dataarray.append(game)
        save()
    }
    
    
//    func remove(_ game:Game){
//        objectWillChange.send()
//
//        manygame.remove(game.internalName)
//        save()
//    }
    
    func save(){
        
    }

}
