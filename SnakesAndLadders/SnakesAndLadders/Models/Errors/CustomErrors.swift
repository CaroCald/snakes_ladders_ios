//
//  CustomErrors.swift
//  SnakesAndLadders
//
//  Created by bayteq on 4/7/23.
//

import Foundation
public enum CustomErrors: Error {

    case genericError

    case customError(message: String)

    case unknown

}
