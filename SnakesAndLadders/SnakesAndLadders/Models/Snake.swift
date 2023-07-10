//
//  Snake.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 20/6/23.
//

import Foundation
public class Snake : Figure {
    
    override var typeOfFigure: TypeOfFigure  {
            get {
                return TypeOfFigure.snake
            }
            set {
               
            }
        }
    override init(initPosition: Int, endPosition: Int) {
        let maxValue = max(initPosition, endPosition)
        let minValue = min(initPosition, endPosition)
        super.init(initPosition: maxValue, endPosition: minValue)
    }
}
