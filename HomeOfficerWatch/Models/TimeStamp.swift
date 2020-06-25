//
//  TimeStamp.swift
//  HomeOfficer
//
//  Created by Filip Wicha on 25/06/2020.
//  Copyright © 2020 Filip Wicha. All rights reserved.
//

import Foundation

struct TimeStamp: Codable, Identifiable {
    
    let id: Int
    let uuid: String
    let relay: Bool
    let power_switch: Bool
    let date: String
    
}

