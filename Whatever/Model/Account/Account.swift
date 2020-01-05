//
//  Account.swift
//  Whatever
//
//  Created by hoopes on 12/29/19.
//  Copyright © 2019 hoopes. All rights reserved.
//

import Foundation
import Combine

class Account: ObservableObject {



    var phoneNumber: PhoneNumber = PhoneNumber()

    let email1 = "matthew.hoopes@gmail.com"
    let email2 = "delosaelizabeth@gmail.com"

    let emails = [
        "email1",
        "email2"
    ]


    var _acctInitialized: Bool = false

//    @Published var initialized: Bool = false
    var initialized: Bool {
        return self._acctInitialized && self.phoneNumber.initialized
    }

    @Published var currEmail: String  = "default..."

    var email: String? {
        willSet {
            currEmail = email ?? "NO EMAIL"
        }
    }
    
    var phoneNumberCancellable: AnyCancellable? = nil

    init() {
        self.monitorPhoneNumberUpdates()
    }

    // Do something here
    // Get all subscriptions the account has access to
    // Load email, account name, etc - where does this come from?
    func load() {

        self.phoneNumber.load()

        let seconds = 2.0
        print("Starting account load...")
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            print("Finished account load...")
            self.email = self.email1

            self._acctInitialized = true
        }
    }

    private func monitorPhoneNumberUpdates() {
        phoneNumberCancellable = self.phoneNumber.objectWillChange.sink { (_) in
            self.objectWillChange.send()
        }
    }

    func togglePhone() {
        self.phoneNumber.toggle()
    }

    func toggleEmail() {
        if self.email == self.email1 {
            self.email = self.email2
        }
        else {
            self.email = self.email1
        }

        print ("EMAIL ADDR NOW: ")
        print (self.email!)
    }
}

