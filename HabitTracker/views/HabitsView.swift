//
//  habits.swift
//  HabitTracker
//
//  Created by Beto Toro on 19/07/22.
//

import SwiftUI

struct HabitsView: View {
  
  let habit: HabitItem
  
  var body: some View {
    HStack {
      HStack {
        Image(systemName: habit.icon)
        Text(habit.title)
          .bold()
      }
      Spacer()
      Button("Complete") {
        
      }
      .foregroundColor(.white)
      .padding(8)
      .background(Color.accentColor)
      .cornerRadius(8)
      .font(.callout)
    }
  }
}

struct HabitsView_Previews: PreviewProvider {
  static var previews: some View {
    HabitsView(habit: HabitItem(title: "habit", description: "description", icon: "book"))
  }
}
