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
            ForEach(listOfHabits.habits) { habit in
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
