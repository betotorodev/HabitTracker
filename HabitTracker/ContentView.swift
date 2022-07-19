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
            ForEach(listOfHabits.NotCompletedHabits) { habit in
              HabitsView(habit: habit)
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
