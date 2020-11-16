//
//  ContentView.swift
//  VStackWithBackgroundColor
//
//  Created by Nick Xu on 14/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      VStack(alignment: .center, spacing: 20) {
        Group{Text("RegEX for Cats")
          .font(Font.system(.largeTitle,design: .rounded))
          .fontWeight(.heavy)
          .foregroundColor(.white)
          .shadow(color:.gray, radius: 5, x: 5, y: 5)
          .padding([.leading, .trailing])
        }
        Group {
        Image("CatOnKeyboard")
          .resizable()
          //.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
          .scaledToFit()
          .padding()}
        
        }.background(Color.catPurple) 
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

fileprivate extension Color {
  static let catPurple = Color(red: 128/255, green: 94/255, blue: 158/255)
}
