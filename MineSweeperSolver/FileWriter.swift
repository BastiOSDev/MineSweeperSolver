//
//  FileWriter.swift
//  MineSweeperSolver
//
//  Created by Sebastian Birchner on 10.08.22.
//

struct FileWriter {
    func printResults(sourceTitle: String) {
        let solvedBoard = Counter().getSolvedBoard(sourceTitle: sourceTitle)
        
        printBoard(solvedBoard)
    }
    
    private func printBoard(_ board: Board) {
        var lastRow = 0
        for element in board.elements {
            let actualRow = element.position.row
            if lastRow < actualRow {
                print()
                lastRow = actualRow
            }
            
            let bombNumber = element.value
            
            if bombNumber < 0 {
                print("*", terminator: " ")
            } else {
                print(element.value, terminator: " ")
            }
        }
    }
}
