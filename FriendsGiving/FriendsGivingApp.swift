//
//  FriendsGivingApp.swift
//  FriendsGiving
//
//  Created by Luke Sutton on 3/9/26.
//

import SwiftUI
import SwiftData

@main
struct FriendsGivingApp: App {
    var body: some Scene {
        WindowGroup {
            GuestListView()
            
                .modelContainer(for: Guest.self)
        }
    }
    
    //will allow us to find where our simulator data is saved on our mac
    init(){
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}

