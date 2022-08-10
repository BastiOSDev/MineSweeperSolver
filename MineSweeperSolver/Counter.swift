//
//  Counter.swift
//  MineSweeperSolver
//
//  Created by Sebastian Birchner on 10.08.22.
//

struct Counter {
    func getSolvedBoard(sourceTitle: String) -> Board {
        let unsolvedBoard = FileRenderer().getBoard(sourceTitle: sourceTitle)
        return calculateCheats(unsolvedBoard)
    }
    
    private func calculateCheats(_ board: Board) -> Board {
        for element in board.elements {
            if element.isBomb {
                let neighbors = getNeighbors(element.position, board: board)
                
                for neighbor in neighbors {
                    neighbor.raiseValue()
                }
            }
        }
        return board
    }
    
    private func getNeighbors(_ position: Position, board: Board) -> [Element] {
        var neighbors = [Element]()
        
        for row in -1...1 {
            for collumn in -1...1 {
                let neighborPosition = getNeighborPosition(position: position, addRow: row, addCollumn: collumn)
                
                if isValidNeighbor(board: board, ownPosition: position, neighborPosition: neighborPosition) {
                    let neighbor = board.getElementAt(neighborPosition)!
                    neighbors.append(neighbor)
                }
            }
        }
        
        return neighbors
    }
    
    private func isValidNeighbor(board: Board, ownPosition: Position, neighborPosition: Position) -> Bool {
        return neighborPosition.isValidPosition(maxCollumns: board.maxCollumns, maxRows: board.maxRows) && !neighborPosition.isOwnPosition(ownPosition)
    }
    
    private func getNeighborPosition(position: Position, addRow: Int, addCollumn: Int) -> Position {
        return Position(row: position.row + addRow, collumn: position.collumn + addCollumn)
    }
}
