//
//  ContentView.swift
//  FriendsGiving
//
//  Created by Luke Sutton on 3/9/26.
//

import SwiftUI
import SwiftData

struct GuestListView: View {
    @Query var guests: [Guest]
    @State private var sheetIsPresented = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(guests) { guest in
                    
                    NavigationLink {
                        DetailView(guest: guest)
                    } label: {
                        Text(guest.name)
                            .font(.title)
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Guests:")
            .toolbar { //must be inside the navigation stack
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                    .buttonStyle(.glassProminent)
                    
                }
            }
        }
        .sheet(isPresented: $sheetIsPresented) {
            NavigationStack {
                DetailView(guest: Guest())
            }
        }
    }
}

#Preview {
    GuestListView()
        .modelContainer(Guest.preview)
}
