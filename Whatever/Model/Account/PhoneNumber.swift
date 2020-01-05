//
//  PhoneNumber.swift
//  Whatever
//
//  Created by hoopes on 12/29/19.
//  Copyright © 2019 hoopes. All rights reserved.
//

import Foundation

class PhoneNumber: ObservableObject {
    @Published var initialized: Bool = false
    @Published var number: String = "my phone number"

    let phone1 = "phone1"
    let phone2 = "phone2"

    // Do something here
    func load() {
        let seconds = 4.0
        print("Starting phone load...")
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            print("Finished phone load...")

            self.number = "hot new shit"

            self.initialized = true
        }
    }

    func toggle() {
        self.number = self.number == self.phone1 ? self.phone2 : self.phone1

        print ("PHONE NOW: ")
        print (self.number)
    }
}
