//
//  SwiftUIView.swift
//  FriendsGiving
//
//  Created by Luke Sutton on 3/9/26.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    @State var guest: Guest
    @State private var name = ""
    @State private var item = ""
    @State private var notes = ""
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack(alignment: .leading){
            TextField("name", text: $name)
                .textFieldStyle(.roundedBorder)
                .font(.title)
                .padding(.bottom)
            
            Text("is bringing:")
                .bold()
            TextField("item", text: $item)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
            
            Text("notes:")
                .bold()
            TextField("notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
            
            Spacer()
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden() // to get rid of chevron button next to x at top
        .toolbar{
            ToolbarItem(placement: .cancellationAction) {
                Button(role: .cancel) {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .confirmationAction) {
                Button(role: .confirm) {
                    //Update the data and save it; if you hit check (save) it will save local things
                    guest.name = name
                    guest.item = item
                    guest.notes = notes
                    modelContext.insert(guest) //how to save
                    //this forces data to save in the simulator
                    guard let _ = try? modelContext.save() else {
                        print("ERROR: Save on DetailView did not work.")
                        return
                    }
                    dismiss()
                }
            } // to save
        }
        .onAppear{
            name = guest.name
            item = guest.item
            notes = guest.notes
        }
    }
}

#Preview {
    // have to add this to see x and toolbar at top
    NavigationStack{
        DetailView(guest: Guest(name: "Lady Gaga", item: "Poker Face Punch", notes: "It's non-alcoholic"))
    }
    
}
