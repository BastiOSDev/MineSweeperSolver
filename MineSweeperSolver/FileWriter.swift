//
//  FileWriter.swift
//  MineSweeperSolver
//
//  Created by Sebastian Birchner on 10.08.22.
//

struct FileWriter {
    let fileTitle: String
    var board: Board {
        return Counter().getSolvedBoard(sourceTitle: fileTitle)
    }
    
    func printResults(sourceTitle: String) {
        let solvedBoard = Counter().getSolvedBoard(sourceTitle: fileTitle)
        
        printTitle(sourceTitle)
        printBoard(solvedBoard)
    }
    
    private func printTitle(_ title: String) {
        print("\n------ \(title) ------")
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
