//
//  ContentView.swift
//  VStack
//
//  Created by Nick Xu on 14/11/20.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
      Image(systemName: "square.and.pencil").font(.system(size: 100, weight: .light, design: .default))
      Text("Hello, this is a sample")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
