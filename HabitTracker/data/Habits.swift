//
//  Habits.swift
//  HabitTracker
//
//  Created by Beto Toro on 19/07/22.
//

import Foundation

class Habits: ObservableObject {
  @Published var NotCompletedHabits = [HabitItem]()
  @Published var completedHabits = [HabitItem]()
}
