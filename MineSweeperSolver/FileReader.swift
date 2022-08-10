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
