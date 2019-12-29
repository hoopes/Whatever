//
//  Account.swift
//  Whatever
//
//  Created by hoopes on 12/29/19.
//  Copyright © 2019 hoopes. All rights reserved.
//

import Foundation

class Account {
//    @Published var email: String  = "default..."
    var email: String  = "default..."

    // Do something here
    func load() {
        let seconds = 2.0
        print("Starting account load...")
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            print("Finished account load...")
            self.email = "matthew.hoopes@gmail.com"
        }

    }
}

