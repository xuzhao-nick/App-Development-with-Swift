//
//  ContentView.swift
//  DatePicker
//
//  Created by Nick Xu on 13/11/20.
//

import SwiftUI

struct ContentView: View {
  @State private var pickedDate = Date()
  var dateFormatter: DateFormatter {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .short
    return dateFormatter
  }
  var body: some View {
    VStack {
      Spacer().padding(50)
      Text("Date pickers")
     
      DatePicker(selection: $pickedDate, displayedComponents: [.date]) {
        Text("Select Date")
      }
      DatePicker("", selection: $pickedDate, displayedComponents: [.date])
        .datePickerStyle(WheelDatePickerStyle())
      DatePicker("Enter your birthday", selection: $pickedDate)
        .datePickerStyle(GraphicalDatePickerStyle())
        .frame(maxHeight: 400)
//      DatePicker(selection: $pickedDate, in: ClosedRange(uncheckedBounds: (lower: Date(), upper: Date(timeIntervalSinceNow: 900000))), displayedComponents:.date) {
//        Text("Select date")
//      }.datePickerStyle(GraphicalDatePickerStyle())
      Text("\(dateFormatter.string(from: pickedDate))")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
