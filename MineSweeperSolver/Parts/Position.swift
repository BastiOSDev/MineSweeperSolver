//
//  Position.swift
//  MineSweeperSolver
//
//  Created by Sebastian Birchner on 10.08.22.
//

struct Position {
    let row: Int
    let collumn: Int
    
    func isOwnPosition(_ position: Position) -> Bool {
        return row == position.row && collumn == position.collumn
    }
    
    func isValidPosition(maxCollumns: Int, maxRows: Int) -> Bool {
        if collumn < 0 || collumn >= maxCollumns {
            return false
        } else if row < 0 || row >= maxRows {
            return false
        }
        return true
    }
}
