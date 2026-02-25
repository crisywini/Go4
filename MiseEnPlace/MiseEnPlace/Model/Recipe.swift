//
//  Recipe.swift
//  MiseEnPlace
//
//  Created by Cristian Sánchez Pineda on 25/02/26.
//

import Foundation

struct Recipe {
    let id: UUID
    let name: String
    let ingredients: [String]
    let steps: [String]?
    let cookingTime: Int?
    let difficultyLevel: Int?
    let pairing: String?
    
    fileprivate init(builder: RecipeBuilder){
        self.id = UUID()
        self.name = builder.name
        self.ingredients = builder.ingredients
        self.steps = builder.steps
        self.cookingTime = builder.cookingTime
        self.difficultyLevel = builder.difficultyLevel
        self.pairing = builder.pairing
    }
}

class RecipeBuilder {
    
    var id: UUID = UUID()
    var name: String = ""
    var ingredients: [String] = []
    var steps: [String]? = []
    var cookingTime: Int? = 0
    var difficultyLevel: Int? = 0
    var pairing: String? = ""
    
    @discardableResult
    func withName(_ name: String) -> Self {
        self.name = name
        return self
    }
    
    @discardableResult
    func withIngredients(_ ingredients: [String]) -> Self {
        self.ingredients = ingredients
        return self
    }
    
    @discardableResult
    func withSteps(_ steps: [String]) -> Self {
        self.steps = steps
        return self
    }
    
    @discardableResult
    func withCookingTime(_ cookingTime: Int) -> Self {
        self.cookingTime = cookingTime
        return self
    }
    
    @discardableResult
    func withDifficultyLevel(_ difficultyLevel: Int) -> Self {
        self.difficultyLevel = difficultyLevel
        return self
    }
    
    @discardableResult
    func withPairing(_ pairing: String) -> Self {
        self.pairing = pairing
        return self
    }
    
    
    func build() -> Recipe {
        guard !name.isEmpty, !ingredients.isEmpty else {
                    fatalError("Name and ingredients are required")
        }
        return Recipe(builder: self)
    }
    
}
