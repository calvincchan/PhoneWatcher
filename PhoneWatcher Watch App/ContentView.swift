//
//  ContentView.swift
//  PhoneWatcher Watch App
//
//  Created by Calvin on 2023-03-28.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject private var connectivityManager = WatchConnectivityManager.shared

  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("PhoneWatch")
    }
    .padding()
    .onAppear {
      print("Started")
    }
    .alert(item: $connectivityManager.notificationMessage) { message in
      Alert(
        title: Text(message.text),
        dismissButton: .default(Text("Dismiss")))
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
