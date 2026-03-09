//
//  Guest.swift
//  FriendsGiving
//
//  Created by Luke Sutton on 3/9/26.
//

import Foundation
import SwiftData

@Model

class Guest {
    var name: String
    var item: String
    var notes: String
    
    init(name: String, item: String, notes: String = "") { //has the option to exlcude notes and this will create an empty string for notes
        self.name = name
        self.item = item
        self.notes = notes
    }
    
    convenience init() {
        self.init(name: "", item: "", notes: "")
    }
}

extension Guest {
    @MainActor
    
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Guest.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        //data
        container.mainContext.insert(Guest(name:"Snoop", item: "Brownies"))
        container.mainContext.insert(Guest(name:"Travis Kelce", item: "Ribs"))
        container.mainContext.insert(Guest(name:"Taylor Swift", item: "Cheese Steaks"))
        container.mainContext.insert(Guest(name:"Beyonce", item: "Taco Salad"))

        return container
    }
}
