//
//  ContentView.swift
//  Image
//
//  Created by Nick Xu on 12/11/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      VStack {
        Image("Holmes")
          //.resizable(capInsets: EdgeInsets(), resizingMode: .tile)
          .scaledToFill()
          .saturation(0.7)
          .contrast(100)
          .hueRotation(Angle(degrees: 300))
          .edgesIgnoringSafeArea([.top,.bottom])
          //.resizable()
          //.aspectRatio(contentMode: .fit)
          //.aspectRatio(contentMode: .fill)
          //aspectRatio(16/9, contentMode: .fit)
          //.scaledToFill()
          //.scaledToFit()
          //.clipShape(Circle())
          //.mask(Image("mascot").resizable())
          //.padding([.leading, .trailing])
      }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      Group {
        ContentView()
        ContentView()
          .previewDevice("iPhone SE")
      }
    }
}
