//
//  DarkSkyError.swift
//  Stormy
//
//  Created by Curtis Stilwell on 5/19/18.
//  Copyright © 2018 Curtis Stilwell. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case jsonConversionFailure
    case invalidUrl
    case jsonParsingFailure
}
