//
//  ContentView.swift
//  MiseEnPlace
//
//  Created by Cristian Sánchez Pineda on 24/02/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State private var showingAddRecipe = false

    var body: some View {
        NavigationStack() {
            ScrollView() {
                VStack(spacing: 20){
                    EmtpyStateView()
                }
                .navigationTitle("Recipes")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action: {showingAddRecipe=true}){
                            Image(systemName: "plus.circle.fill")
                                .font(.system(size:20))
                                .foregroundColor(.green)
                        }
                    }
                }
                .sheet(isPresented: $showingAddRecipe){
                    AddRecipeView()
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

struct CardView: View {
    
    let value: String
    
    var body: some View {
        VStack(spacing: 6){
            Text(value)
                .font(.headline)
                .bold()
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}

struct EmtpyStateView: View {
    var body: some View {
        VStack(spacing: 6){
            Spacer(minLength: 150)
            Image(systemName: "fork.knife.circle")
                .font(.system(size:60))
            Text("No recipes yet")
                .bold()
                .font(.title2)
            Text("Tap + to create your first!")
                .foregroundColor(.secondary)
        }
        .padding(.top, 60)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
