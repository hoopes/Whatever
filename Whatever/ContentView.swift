//
//  ContentView.swift
//  Whatever
//
//  Created by hoopes on 12/29/19.
//  Copyright © 2019 hoopes. All rights reserved.
//

import SwiftUI


struct ContentView: View {

    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {

            if (self.appState.initialized) {
                Text("EMAIL")
                Text(self.appState.account.email)
                Text(self.appState.account.phoneNumber.number)

                Button(action: {
                    self.appState.account.toggleEmail()
                }) {
                    Text("email")
                }

                Button(action: {
                    self.appState.account.togglePhone()
                }) {
                    Text("phone")
                }
            }
            else {
                Text("LOADING")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
