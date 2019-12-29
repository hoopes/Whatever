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
    @EnvironmentObject var acct: Account

    var body: some View {
        VStack {
            Text("EMAIL")
            Text(acct.email)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
