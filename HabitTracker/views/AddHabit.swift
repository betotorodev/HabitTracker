//
//  AddHabit.swift
//  HabitTracker
//
//  Created by Beto Toro on 19/07/22.
//

import SwiftUI

struct AddHabit: View {
  
  @State private var title = ""
  @State private var description = ""
  @State private var icon = ""
  
  let icons = ["book", "car", "house", "powersleep", "drop", "suit.heart"]
  
  let columns = [
    GridItem(.adaptive(minimum: 100))
  ]
  
  var body: some View {
    Form {
      VStack {
        Text("Add a habit")
        
        Section {
          TextField("title", text: $title)
          TextField("description", text: $title)
        }
        
        Section("Choose an icon") {
          LazyVGrid(columns: columns) {
            ForEach(icons, id: \.self) { icon in
              VStack {
                Image(systemName: icon)
                  .font(Font.system(.largeTitle).bold())
                  .padding()
                  .frame(width: 100, height: 100)
              }
            }
          }
        }
        
      }
    }
  }
}

struct AddHabit_Previews: PreviewProvider {
  static var previews: some View {
    AddHabit()
  }
}
