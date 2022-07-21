//
//  Habits.swift
//  HabitTracker
//
//  Created by Beto Toro on 19/07/22.
//

import Foundation

class Habits: ObservableObject {
  @Published var NotCompletedHabits = [HabitItem]() {
    didSet {
      if let encoded = try? JSONEncoder().encode(NotCompletedHabits) {
        UserDefaults.standard.set(encoded, forKey: "NotCompletedHabits")
      }
    }
  }
  @Published var completedHabits = [HabitItem]() {
    didSet {
      if let encoded = try? JSONEncoder().encode(completedHabits) {
        UserDefaults.standard.set(encoded, forKey: "completedHabits")
      }
    }
  }
  
  init() {
    if let savedNotCompletedTask = UserDefaults.standard.data(forKey: "NotCompletedHabits"),
       let savedCompletedTask = UserDefaults.standard.data(forKey: "completedHabits") {
      if let decodedNotCompletedTask = try? JSONDecoder().decode([HabitItem].self, from: savedNotCompletedTask),
         let decodedCompletedTask = try? JSONDecoder().decode([HabitItem].self, from: savedCompletedTask){
        NotCompletedHabits = decodedNotCompletedTask
        completedHabits = decodedCompletedTask
        return
      }
    }
    
    NotCompletedHabits = []
    completedHabits = []
  }
  
}
