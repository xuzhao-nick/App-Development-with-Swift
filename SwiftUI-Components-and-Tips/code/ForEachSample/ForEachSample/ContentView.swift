//
//  ContentView.swift
//  ForEachSample
//
//  Created by Nick Xu on 21/11/20.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
      VStack {
        ForEach(tips, id: \.self) { tip in
          VStack {
            Image("Meditate")
              .resizable()
              .scaledToFit()
            Text("Cat relaxation tip number \(tip)")
          }
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
