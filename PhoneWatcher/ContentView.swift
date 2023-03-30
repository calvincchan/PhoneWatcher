//
//  ContentView.swift
//  PhoneWatcher
//
//  Created by Calvin on 2023-03-28.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Detecting movement...")
        .font(.title)
        .fontWeight(.semibold)
        .padding(.top, 8)
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
