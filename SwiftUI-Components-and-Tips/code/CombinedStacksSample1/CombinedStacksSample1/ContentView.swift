//
//  ContentView.swift
//  CombinedStacksSample1
//
//  Created by Nick Xu on 16/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack {
        
        Circle()
          .fill(Color.catPurple)
          .frame(width: 170, height: 170)
          .padding()
          .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
        VStack {
          Image("CatOnKeyboard")
            .resizable()
            .frame(width: 150, height: 150)
          Text("RegEx for Cats")
            .font(Font.system(.largeTitle, design: .rounded))
            .padding()
            .background(Color.red)
            .cornerRadius(15)
        }
        Spacer()
          .layoutPriority(1)
      }
      .background(Color.rayWenderlichGreen)
      .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


fileprivate extension Color {
  static let catPurple = Color(red: 128/255, green: 94/255, blue: 158/255)
  static let rayWenderlichGreen = Color(red: 21/255, green: 132/255, blue: 67/255)
}
