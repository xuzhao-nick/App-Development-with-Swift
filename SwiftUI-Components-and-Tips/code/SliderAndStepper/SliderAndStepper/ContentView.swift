//
//  ContentView.swift
//  SliderAndStepper
//
//  Created by Nick Xu on 13/11/20.
//

import SwiftUI

struct ContentView: View {
  @State private var orderCount = 0
  @State private var houseTemperature: Double = 0
  var body: some View {
    VStack {
      Stepper(
        onIncrement: {
          self.orderCount += 1
        },
        onDecrement: {
          self.orderCount -= 1
        }){
        Text("Set order amount")
      }
//      Stepper("Set order amount", value: $orderCount)
      
      Text("Current order amount: \(orderCount)")
      Slider(value: $houseTemperature, in: (30...120))
      Text("\(houseTemperature)")
      
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
