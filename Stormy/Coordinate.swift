//
//  Coordinate.swift
//  Stormy
//
//  Created by Curtis Stilwell on 5/22/18.
//  Copyright © 2018 Curtis Stilwell. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longitude: Double
}


extension Coordinate: CustomStringConvertible {
    var description: String {
        return "\(latitude),\(longitude)"
    }
}
