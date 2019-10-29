//  Created by paulchainkang on 2019/10/26.
//  Copyright © 2019 paulchainkang. All rights reserved.

import SwiftUI

struct ContentView: View {
  @ObservedObject var ble = BLEConnection()

  
  var body: some View {
    NavigationView {
      VStack (alignment: .leading){
        Text("Peripheral Name").font(.title).foregroundColor(.purple)
        List (ble.scannedBLEDevices) { device in
          Text(device.name)
        }
        Divider()
        Text("Local Name").font(.title).foregroundColor(.red)
        List (ble.scannedBLENames) { device in
          Text(device.name)
        }
      }
      .padding()
//      .alert(isPresented: $ble.showAlert) {
//          Alert(title: Text("HAHA"))
//      }
      .navigationBarTitle("BLE Devices")
    }
    .onAppear(perform: connectBLEDevice)
  }
  
  private func connectBLEDevice(){
    // Start Scanning for BLE Devices
    //ble.showAlert = true
    ble.startCentralManager()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
