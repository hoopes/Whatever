//
//  AppState.swift
//  Whatever
//
//  Created by hoopes on 12/29/19.
//  Copyright © 2019 hoopes. All rights reserved.
//

import Foundation
import Combine

class AppState: ObservableObject {

    @Published var account: Account = Account()
    @Published var initialized: Bool = false

    // Used in account monitor
    var accountCancellable: AnyCancellable? = nil

    init() {
        self.monitorAccountUpdates()
        
        self.account.load()

        let seconds = 2.0
        print("Starting app init...")
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            print("Finished app init...")
            self.initialized = true
        }
    }

    /** Keep an eye on account changes, and tell the views this object changed when it does */
    private func monitorAccountUpdates() {
        accountCancellable = self.account.objectWillChange.sink { (_) in
            self.objectWillChange.send()
        }
    }

}
