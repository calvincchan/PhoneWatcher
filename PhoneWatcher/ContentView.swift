//
//  ContentView.swift
//  PhoneWatcher
//
//  Created by Calvin on 2023-03-28.
//

import CoreMotion
import SwiftUI

struct ContentView: View {
  let motionManager = CMMotionManager()

  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Detecting movement...")
        .font(.title)
        .fontWeight(.semibold)
        .padding(.top, 8)
      Button(
        "Test",
        action: {
          WatchConnectivityManager.shared.send("Movement detected!")
        })
    }
    .padding()
    .onAppear {
      if self.motionManager.isAccelerometerAvailable {
        self.motionManager.accelerometerUpdateInterval = 0.2
        self.motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
          if let error = error {
            print("Error: \(error.localizedDescription)")
            return
          }

          if let data = data {
            let acceleration = sqrt(
              pow(data.acceleration.x, 2) + pow(data.acceleration.y, 2)
                + pow(data.acceleration.z, 2))

            if acceleration > 1.09 {
              // Send a notification to the Apple Watch
              WatchConnectivityManager.shared.send("Movement detected!")
            }
          }
        }
      } else {
        print("Accelerometer not available")
      }
    }
    .onDisappear {
      self.motionManager.stopAccelerometerUpdates()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
