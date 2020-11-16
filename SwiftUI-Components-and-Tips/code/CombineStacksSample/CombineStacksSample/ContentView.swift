//
//  ContentView.swift
//  CombineThreeStacksSample
//
//  Created by Nick Xu on 16/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      VStack(alignment: .leading) {
        Text("Sign Up your Cat for Regex for Cats!")
          .font(Font.system(.headline, design: .rounded))
          .fontWeight(.heavy)
          .foregroundColor(.white)
          .shadow(color: .gray, radius: 5, x: 5, y: 0.05)
          .padding([.top, .bottom])
        HStack {
          Image("CatOnKeyboard")
            .resizable()
            .frame(width: 50, height: 50)
          Button(action: {
            print("Signed up")
          }) {
            HStack {
              Text("Sign Up Today!")
              Image(systemName: "checkmark.circle")
            }
          }
          .padding()
          .background(Color.catPurple)
          .foregroundColor(.white)
          .shadow(radius: 5)
        }
      }
      
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

