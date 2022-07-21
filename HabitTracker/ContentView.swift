//
//  ContentView.swift
//  HabitTracker
//
//  Created by Beto Toro on 19/07/22.
//

import SwiftUI

struct ContentView: View {
  
  @StateObject var listOfHabits = Habits()
  @State private var showingAddHabit = false
  
  var body: some View {
    NavigationView {
      Group {
        
        List {
          if listOfHabits.NotCompletedHabits.isEmpty {
            HStack {
              Spacer()
              Text("Add a task")
                .foregroundColor(.secondary)
                .font(.subheadline)
              Spacer()
            }
          } else {
            Section("Task to complete") {
              ForEach(listOfHabits.NotCompletedHabits) { habit in
                HabitsView(habit: habit, listOfHabits: listOfHabits, typeOfAction: TypeOfAction.Complete)
              }
            }
          }
          
          if !listOfHabits.completedHabits.isEmpty {
            Section("Task completed") {
              ForEach(listOfHabits.completedHabits) { habit in
                HabitsView(habit: habit, listOfHabits: listOfHabits, typeOfAction: TypeOfAction.UnComplete)
              }
            }
          }
          
        }
        
      }
      .navigationTitle("Habit tracker")
      .toolbar {
        Button {
          showingAddHabit.toggle()
        } label: {
          Image(systemName: "plus")
        }
        .foregroundColor(.black)
      }
      .sheet(isPresented: $showingAddHabit) {
        AddHabit(habits: listOfHabits)
      }
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
