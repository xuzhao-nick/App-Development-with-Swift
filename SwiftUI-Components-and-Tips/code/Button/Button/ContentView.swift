//
//  ContentView.swift
//  Button
//
//  Created by Nick Xu on 13/11/20.
//

import SwiftUI

struct ContentView: View {
  
  let foodPrinter: () -> () = {
    print("The food was so good!")
  }
  
  let meow = "Meeeow"
  
  var body: some View {
    VStack {
      Button(action: {
        
      }){
        VStack {
          Text("Give gift")
          //SFSymbole library
          Image(systemName: "gift")
            .font(Font.system(.largeTitle))
        }
      }
      Button(action: foodPrinter, label: {
        VStack {
          Image("Cat")
            .renderingMode(.original)
            //.renderingMode(.template)
            .resizable()
            .scaledToFit()
            .shadow(radius: 10)
            .padding()
          Text("Feed Cat!")
            .font(Font.system(.headline, design: .rounded))
            .foregroundColor(.primary)
            .padding([.leading,.trailing], 10)
            .padding([.top, .bottom], 5)
            .background(Color.purple)
            .cornerRadius(5)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 5)

        }

      })
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
