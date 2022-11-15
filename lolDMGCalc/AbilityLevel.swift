//
//  AbilityLevel.swift
//  lolDMGCalc
//
//  Created by Laurin Notemann on 14.11.22.
//

import Foundation

enum LevelKind: String, CaseIterable {
    case q, w, e, r
}

struct AbilityLevel {
    var qLevel: Int = 0
    var wLevel: Int = 0
    var eLevel: Int = 0
    var rLevel: Int = 0
    
    mutating public func newValue(_ value: Int, for kind: LevelKind) {
        switch kind {
        case .q:
            qLevel = value
        case .w:
            wLevel = value
        case .e:
            eLevel = value
        case .r:
            rLevel = value
        }
    }
}
