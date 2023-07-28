//
//  Guards.swift
//  SnakesAndLadders
//
//  Created by bayteq on 5/7/23.
//

import Foundation
public func guardValidBoard(value: Int?, alert: String) throws -> Int {
    
    if let value = value {
        guard value > 0 else {
            throw CustomErrors.customError(message: alert)
        }
    }else {
        throw CustomErrors.customError(message: alert)
    }
    
    return value!
}

public func guardValidSnake(snakes : Array<Snake>, boardZise: Int ,alert: String) throws -> Array<Snake> {
    
    for sn in snakes {
        guard sn.initPosition != boardZise else{
            throw CustomErrors.customError(message: Constants.errorSnakesInitBoard)
        }
        guard sn.initPosition != 0 else{
            throw CustomErrors.customError(message: Constants.errorSnakesEndBoard)
        }
        guard sn.endPosition-1 < boardZise && sn.endPosition-1 > 0 else {
            throw CustomErrors.customError(message: alert)
        }
        guard sn.initPosition-1 < boardZise && sn.endPosition-1 > 0 else{
            throw CustomErrors.customError(message: alert)
        }
        
    }
    
    return snakes
}

public func guardValidLadder(ladder : Array<Ladder>, boardZise: Int ,alert: String) throws -> Array<Ladder> {
    
    for sn in ladder {
        guard sn.initPosition != boardZise else{
            throw CustomErrors.customError(message: Constants.errorLadderEndBoard)
        }
        guard sn.initPosition != 0 else {
            throw CustomErrors.customError(message: Constants.errorLadderInitBoard)
        }
        guard sn.endPosition-1 < boardZise && sn.endPosition-1 > 0 else {
            throw CustomErrors.customError(message: alert)
        }
        guard sn.initPosition-1 < boardZise && sn.endPosition-1 > 0 else{
            throw CustomErrors.customError(message: alert)
        }
        
    }
    
    return ladder
}
