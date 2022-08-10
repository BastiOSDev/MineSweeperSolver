//
//  Board.swift
//  MineSweeperSolver
//
//  Created by Sebastian Birchner on 10.08.22.
//

struct Board {
    var elements: [Element]
    let maxRows: Int
    let maxCollumns: Int
    
    func getElementAt(_ position: Position) -> Element? {
        for element in elements {
            if element.position.isOwnPosition(position) {
                return element
            }
        }
        return nil
    }
}
