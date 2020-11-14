//
//  ContentView.swift
//  ZStackSample
//
//  Created by Nick Xu on 14/11/20.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      Image("image1")
      Text("Hello, world").font(Font.system(size: 50, weight: .heavy))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
