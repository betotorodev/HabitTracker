//
//  habits.swift
//  HabitTracker
//
//  Created by Beto Toro on 19/07/22.
//

import SwiftUI

struct HabitsView: View {
  
  let habit: HabitItem
  @ObservedObject var listOfHabits: Habits
  let typeOfAction: TypeOfAction
  
  func removeAndAddItem(habitsToRemove: inout [HabitItem]) {
    if let item = habitsToRemove.firstIndex(of: habit) {
      habitsToRemove.remove(at: item)
    }
  }
  
  var body: some View {
    
    let isComplete = typeOfAction == TypeOfAction.Complete
    
    HStack {
      HStack {
        Image(systemName: habit.icon)
        Text(habit.title)
          .bold()
      }
      Spacer()
      Button(isComplete ? "Complete" : "Completed") {
        if isComplete {
          withAnimation {
            removeAndAddItem(habitsToRemove: &listOfHabits.NotCompletedHabits)
            listOfHabits.completedHabits.append(habit)
          }
        } else {
          withAnimation {
            removeAndAddItem(habitsToRemove: &listOfHabits.completedHabits)
            listOfHabits.NotCompletedHabits.append(habit)
          }
        }
      }
      .foregroundColor(.white)
      .padding(8)
      .background(isComplete ? Color.accentColor : Color.green)
      .cornerRadius(8)
      .font(.callout)
    }
  }
}

struct HabitsView_Previews: PreviewProvider {
  static var previews: some View {
    HabitsView(habit: HabitItem(title: "habit", description: "description", icon: "book"), listOfHabits: Habits(), typeOfAction: TypeOfAction.Complete)
  }
}
