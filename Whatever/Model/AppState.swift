//
//  AppState.swift
//  Whatever
//
//  Created by hoopes on 12/29/19.
//  Copyright © 2019 hoopes. All rights reserved.
//

import Foundation

class AppState: ObservableObject {

    @Published var account: Account
    @Published var initialized: Bool = false

    init() {
        self.account = Account()
        self.account.load()

        let seconds = 2.0
        print("Starting app init...")
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            print("Finished app init...")
            self.initialized = true
        }
    }

}
