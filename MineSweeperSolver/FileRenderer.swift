//
//  FileRenderer.swift
//  MineSweeperSolver
//
//  Created by Sebastian Birchner on 10.08.22.
//

import Foundation

struct FileRenderer {
    func getBoard(sourceTitle: String) -> Board {
        let rows = FileReader().getFile(sourceTitle)
        return parseRows(rows)
    }
    
    private func parseRows(_ rows: [String]) -> Board {
        let maxRows = rows.count
        let maxCollumns = rows[0].count
        var elements = [Element]()
        
        for (rowIndex, row) in rows.enumerated() {
            for (collumnIndex, element) in row.enumerated() {
                let position = Position(row: rowIndex, collumn: collumnIndex)
                
                if element == "*" {
                    elements.append(Element(position: position, isBomb: true))
                } else {
                    elements.append(Element(position: position, isBomb: false))
                }
            }
        }
        
        return Board(elements: elements, maxRows: maxRows, maxCollumns: maxCollumns)
    }
}
