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
            Text("EMAIL")
            Text(appState.account.email)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
