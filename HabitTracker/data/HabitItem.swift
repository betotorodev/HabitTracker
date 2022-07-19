//
//  HabitItem.swift
//  HabitTracker
//
//  Created by Beto Toro on 19/07/22.
//

import Foundation

struct HabitItem: Identifiable {
  let id = UUID()
  let title: String
  let description: String
  let icon: String
}