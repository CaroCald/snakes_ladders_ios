//
//  Ladder.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 20/6/23.
//

import Foundation
public class Ladder : Figure {
    override var typeOfFigure: TypeOfFigure {
        return TypeOfFigure.ladder
    }
    
    override init(initPosition: Int, endPosition: Int) {
        let maxValue = max(initPosition, endPosition)
        let minValue = min(initPosition, endPosition)
        super.init(initPosition: minValue, endPosition: maxValue)
    }
}
