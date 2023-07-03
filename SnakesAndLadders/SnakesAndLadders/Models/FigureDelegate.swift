//
//  FigureDelegate.swift
//  SnakesAndLadders
//
//  Created by bayteq on 3/7/23.
//

import Foundation
protocol FigureDelegate {
    var initPosition: Int { get set  }
    var endPosition: Int { get set }
    var typeOfFigure: TypeOfFigure { get set }
    func createFigure(endPosition: Int, endPosition: Int, typeOfFigure: TypeOfFigure)
}
