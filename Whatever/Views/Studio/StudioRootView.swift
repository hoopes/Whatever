//
//  StudioRootView.swift
//  Whatever
//
//  Created by hoopes on 1/4/20.
//  Copyright © 2020 hoopes. All rights reserved.
//

import SwiftUI

struct StudioRootView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Text("EMAIL")
                .font(.title)

            Text(self.appState.account.currEmail)

            Text(self.appState.account.phoneNumber.number)
                .padding()
                .border(Color.black)

            Text("PROJECT")
                .font(.title)

            Text(self.appState.projectManager.currentProject.title)

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

            Button(action: {
                self.appState.projectManager.toggleProject()
            }) {
                Text("project")
            }
        }
    }


}
