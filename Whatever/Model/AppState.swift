//
//  AppState.swift
//  Whatever
//
//  Created by hoopes on 12/29/19.
//  Copyright © 2019 hoopes. All rights reserved.
//

import Combine

class AppState: ObservableObject {

    // FIXME: Take app config from env?
    static let instance = AppState()

    let account: Account = Account()
    let projectManager: ProjectManager = ProjectManager()
    let audioManager: AudioManager = AudioManager()

    // Global initialized flag - once this is true, the app is ready to run
    var initialized: Bool {
        return self.account.initialized &&
               self.projectManager.initialized &&
               self.audioManager.initialized
    }

    // Used in account monitor
    var accountCancellable: AnyCancellable? = nil
    var projectCancellable: AnyCancellable? = nil

    private init() {
        self.monitorNestedUpdates()
        self.account.load()
        self.projectManager.load()
    }

    /** Keep an eye on nested object changes, and tell the views this object changed when it does */
    private func monitorNestedUpdates() {

        accountCancellable = self.account.objectWillChange.sink { (_) in
            self.objectWillChange.send()
        }

        projectCancellable = self.projectManager.objectWillChange.sink { (_) in
            self.objectWillChange.send()
        }
    }

}
