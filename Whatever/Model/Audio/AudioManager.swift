//
//  Manager.swift
//  Whatever
//
//  Created by hoopes on 1/4/20.
//  Copyright © 2020 hoopes. All rights reserved.
//

import AudioKit

class AudioManager: ObservableObject {
    var initialized: Bool = true

    var mixer: AKMixer!
    var mic: AKMicrophone!
}
