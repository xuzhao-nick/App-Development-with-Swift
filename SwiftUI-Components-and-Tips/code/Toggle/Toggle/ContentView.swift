//
//  ContentView.swift
//  Toggle
//
//  Created by Nick Xu on 13/11/20.
//

import SwiftUI

struct ContentView: View {
  var isActivatedMessage: String {
    return "CatNip is " + (isActivated ? "Activated!" : "Deactivated")
  }
  @State private var isActivated = false
  var body: some View {
    VStack {
      Toggle("Activate Cat Nip!", isOn: $isActivated)
      Text(isActivatedMessage)
        .foregroundColor(isActivated ? .green : .red)
        .fontWeight(isActivated ? .heavy : .regular)
      Toggle(isOn: $isActivated) {
        VStack {
          Image("CatNip")
            .resizable()
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)        }
        Text("Activate Catnip!")
      }
    }

  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
