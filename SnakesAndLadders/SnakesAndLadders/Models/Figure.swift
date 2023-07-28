//
//  Figure.swift
//  SnakesAndLadders
//
//  Created by bayteq on 3/7/23.
//

import Foundation
public class Figure {
    var initPosition: Int
    var endPosition: Int
    var typeOfFigure: TypeOfFigure {
           return TypeOfFigure.normal
    }
    
    init(initPosition: Int, endPosition: Int) {
        self.initPosition = initPosition
        self.endPosition = endPosition
    }
    
}
