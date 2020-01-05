//
//  Project.swift
//  Whatever
//
//  Created by hoopes on 1/4/20.
//  Copyright © 2020 hoopes. All rights reserved.
//

import Foundation

class Project: ObservableObject {

    @Published var title: String
    @Published var numShownCarts: Int

    // list of carts...

    // How do i initialize from firestore?
    init(title: String) {
        self.title = title
        self.numShownCarts = 12
    }


    func loadCarts() {

    }
}
