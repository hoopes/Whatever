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
    let email1 = "matthew.hoopes@gmail.com"
    let email2 = "delosaelizabeth@gmail.com"

    let phone1 = "phone1"
    let phone2 = "phone2"

    @Published var initialized: Bool = false
    @Published var email: String  = "default..."

    var phoneNumber: PhoneNumber = PhoneNumber()

    var phoneNumberCancellable: AnyCancellable? = nil

    init() {
        self.monitorPhoneNumberUpdates()
    }

    // Do something here
    func load() {
        let seconds = 2.0
        print("Starting account load...")
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            print("Finished account load...")
            self.email = self.email1

            self.phoneNumber.number = "hot new shit"
        }
    }

    private func monitorPhoneNumberUpdates() {
        phoneNumberCancellable = self.phoneNumber.objectWillChange.sink { (_) in
            self.objectWillChange.send()
        }
    }

    func togglePhone() {
        self.phoneNumber.number = self.phoneNumber.number == self.phone1 ? self.phone2 : self.phone1

        print ("PHONE NOW: ")
        print (self.phoneNumber.number)
    }

    func toggleEmail() {
        if self.email == self.email1 {
            self.email = self.email2
        }
        else {
            self.email = self.email1
        }

        print ("EMAIL ADDR NOW: ")
        print (self.email)
    }
}

