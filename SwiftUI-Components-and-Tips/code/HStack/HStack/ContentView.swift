//
//  ContentView.swift
//  HStack
//
//  Created by Nick Xu on 14/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      HStack(alignment:.lastTextBaseline, spacing:20) {
        Text("My favourite Pet\n is a ").lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
        Text("Dog").font(Font.system(size: 50, weight: .heavy))
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
