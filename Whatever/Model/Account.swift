//
//  Account.swift
//  Whatever
//
//  Created by hoopes on 12/29/19.
//  Copyright © 2019 hoopes. All rights reserved.
//

import Foundation

class Account: ObservableObject {
    @Published var email: String  = "default..."

    // Do something here
    func load() {
        let seconds = 2.0
        print("Starting account load...")
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            // Put your code which should be executed with a delay here
            print("Finished account load...")
            self.email = "matthew.hoopes@gmail.com"
        }

    }
}

