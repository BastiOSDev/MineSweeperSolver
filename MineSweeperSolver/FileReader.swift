//
//  FileReader.swift
//  MineSweeperSolver
//
//  Created by Sebastian Birchner on 10.08.22.
//

import Foundation

struct FileReader {
    func getFile(_ title: String) -> [String] {
        let file = Bundle.main.url(forResource: title, withExtension: "txt")!
        
        do {
            try checkFile(url: file)
            return try getContent(file)
        } catch {
            return []
        }
    }
    
    func isPossibleFile(_ title: String) -> Bool {
        if Bundle.main.url(forResource: title, withExtension: "txt") != nil {
            return true
        } else {
            return false
        }
    }
    
    private func checkFile(url: URL) throws {
        if url.pathExtension != "txt" {
            print("error")
        }
    }
    
    private func getContent(_ file: URL) throws -> [String] {
        let content = try String(contentsOf: file)
        let parsedtxt: [String] = content.components(
            separatedBy: "\n"
        ).map{ $0.components(separatedBy: "")[0] }
        return parsedtxt
    }
}
