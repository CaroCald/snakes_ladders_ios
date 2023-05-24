//
//  Board.swift
//  SnakesAndLadders
//
//  Created by Carolina Calderon on 17/5/23.
//

import Foundation

struct Board {
    let rows: Int, columns: Int
    var grid: [Int]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: 0, count: rows * columns)
    }
    
}
