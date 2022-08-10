//
//  Element.swift
//  MineSweeperSolver
//
//  Created by Sebastian Birchner on 10.08.22.
//

class Element {
    let position: Position
    private (set) var value: Int
    let isBomb: Bool
    
    init(position: Position, isBomb: Bool) {
        self.position = position
        self.isBomb = isBomb
        if isBomb {
            self.value = -99
        } else {
            self.value = 0
        }
    }
    
    func raiseValue() {
        value += 1
    }
}
