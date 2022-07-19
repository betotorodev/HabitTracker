//
//  AddHabit.swift
//  HabitTracker
//
//  Created by Beto Toro on 19/07/22.
//

import SwiftUI

struct AddHabit: View {
  
  @ObservedObject var habits: Habits
  @State private var title = ""
  @State private var description = ""
  @State private var icon = ""
  @Environment(\.dismiss) var dismiss
  
  let icons = ["book", "car", "house", "powersleep", "drop", "suit.heart"]
  
  let columns = [
    GridItem(.adaptive(minimum: 100))
  ]
  
  var body: some View {
    NavigationView {
      Form {
        VStack {
          Section {
            TextField("title", text: $title)
            TextField("description", text: $description)
          }
          
          Section("Choose an icon") {
            LazyVGrid(columns: columns) {
              ForEach(icons, id: \.self) { symbol in
                VStack {
                  Image(systemName: symbol)
                    .foregroundColor(icon == symbol ? .blue : .black)
                    .font(Font.system(.largeTitle).bold())
                    .padding()
                    .frame(width: 100, height: 100)
                    .onTapGesture {
                      withAnimation {
                        icon = symbol                        
                      }
                    }
                }
              }
            }
          }
          
        }
      }
      .navigationTitle("Add a habit")
      .toolbar {
        Button("Done") {
          let habit = HabitItem(title: title, description: description, icon: icon)
          habits.NotCompletedHabits.append(habit)
          dismiss()
        }
    }
    }
  }
}

struct AddHabit_Previews: PreviewProvider {
  static var previews: some View {
    AddHabit(habits: Habits())
  }
}
