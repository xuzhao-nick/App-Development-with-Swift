//
//  ContentView.swift
//  ZStack
//
//  Created by Nick Xu on 13/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      ZStack {
        //Following line also can help to set whole screen to green
        //Color.rayWenderlichGreen
        VStack {
          Image("Cat")
            .resizable()
            .frame(width: 150, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .blendMode(.hardLight)
          Text("😻 Meow! 😻")
            .font(Font.system(.largeTitle, design: .monospaced))
            .fontWeight(.bold)
            .foregroundColor(.white)
            .shadow(color: Color.black, radius: 10, x: 10, y: 10)
            .rotationEffect(.degrees(-10))
          
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

extension Color {
  static let rayWenderlichGreen = Color(red: 21/255, green: 132/255, blue: 67/255)
}
