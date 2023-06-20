//
//  Snake.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 20/6/23.
//

import Foundation
struct Snake {
    var initPosition : Int
    var endPosition : Int
    var identificator : Int = 5
    
    init(initPosition: Int, endPosition: Int) {
        self.initPosition = initPosition
        self.endPosition = endPosition
    }
}
