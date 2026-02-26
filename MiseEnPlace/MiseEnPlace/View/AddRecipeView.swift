//
//  AddRecipeView.swift
//  MiseEnPlace
//
//  Created by Cristian Sánchez Pineda on 25/02/26.
//

import Foundation
import SwiftUI

struct AddRecipeView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var id: UUID = UUID()
    @State private var name: String = ""
    @State private var ingredients: [String] = []
    @State private var steps: [String] = []
    @State private var cookingTime  = ""
    @State private var difficultyLevel = ""
    @State private var pairing = ""
    @State private var newIngredient = ""
    @State private var newStep = ""
    @State private var showDiscardAlert = false

    var isFormValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && !ingredients.isEmpty
    }

    var hasUnsavedChanges: Bool {
        !name.isEmpty || !ingredients.isEmpty || !steps.isEmpty
    }
    
    
    var body: some View {
        NavigationStack() {
            Form {
                basicInfoSection
                ingredientsSection
                stepsSection
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("cancel"){
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction){
                    Button("save") {
                        saveRecipe()
                    }
                    .disabled(!isFormValid)
                    .bold()
                }
            }
        }
    }
    
    var basicInfoSection: some View {
        Section("Basic Info"){
            TextField("Recipe Name", text: $name)
            HStack {
                Image(systemName: "clock").foregroundColor(.blue)
                TextField("Cooking time", text: $cookingTime)
                    .keyboardType(.numberPad)
            }
            HStack {
                Image(systemName: "flag.pattern.checkered.circle").foregroundColor(.blue)
                TextField("Cooking time", text: $difficultyLevel)
                    .keyboardType(.numberPad)
            }
            HStack {
                Image(systemName: "spoon.serving").foregroundColor(.blue)
                TextField("Pairing", text: $pairing)
            }
        }
    }
    
    var ingredientsSection: some View {
        
        Section("Ingredients") {
            ForEach(ingredients, id: \.self){ ingredient in
                HStack {
                    Image(systemName: "checkmark.circle.fill").foregroundColor(.green)
                    Text(ingredient)
                }
            }
            .onDelete{ingredients.remove(atOffsets:$0)}
            
            HStack {
                TextField("Add ingredient", text: $newIngredient)
                Button(action: addIngredient){
                    Image(systemName: "plus.circle.fill").foregroundColor(.green)
                }
                .disabled(newIngredient.trimmingCharacters(in: .whitespaces).isEmpty)
            }
        }
    }
    
    var stepsSection: some View {
        Section("Steps") {
            ForEach(Array(steps.enumerated()), id: \.offset) { index, step in
                HStack(alignment: .top, spacing: 10){
                    Text("\(index + 1).").bold().foregroundColor(.green)
                        Text(step)
                }
            }
            .onDelete {
                steps.remove(atOffsets: $0)
            }
            
            HStack {
                TextField("Add step", text: $newStep)
                Button(action: addStep) {
                    Image(systemName: "plus.circle.fill").foregroundColor(.green)
                }
                .disabled(newStep.trimmingCharacters(in: .whitespaces).isEmpty)
            }
        }
    }
    
    private func addIngredient(){
        let trimmed = newIngredient.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else {return}
        ingredients.append(trimmed)
        newIngredient = ""
    }
    
    private func addStep() {
        let trimmed = newStep.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else {return}
        steps.append(trimmed)
        newStep = ""
    }
    
    private func saveRecipe() {
        let recipe = RecipeBuilder()
            .withName(name)
            .withSteps(steps)
            .withCookingTime(Int(cookingTime) ?? 0)
            .withDifficultyLevel(Int(difficultyLevel) ?? 0)
            .withPairing(pairing)
            .withIngredients(ingredients)
            .build()
        
        dismiss()
    }
}
