//
//  ContentView.swift
//  MineSweeperSolver
//
//  Created by Sebastian Birchner on 10.08.22.
//

import SwiftUI

struct ContentView: View {
    @State private var fileTitle: String = ""
    @State private var isCorrectFilename: Bool = false
    private var isValidFileName: Bool {
        return FileReader().isPossibleFile(fileTitle)
    }
    
    private var showNavigationLink: Bool {
        return isValidFileName && fileTitle != ""
    }
    
    var body: some View {
        NavigationView {
            HStack {
                Spacer(minLength: 50)
                VStack {
                    VStack {
                        TextField("Filetitle", text: $fileTitle)
                            .frame(alignment: .center)
                            .textInputAutocapitalization(.never)
                            .disableAutocorrection(true)
                            .border(.secondary)
                            .frame(width: 200)
                            .onSubmit {
                                // TODO: Present ResultView
                            }
                    }
                    if showNavigationLink {
                        let viewModel = ResultViewModel(board: FileWriter(fileTitle: fileTitle).board, title: fileTitle)
                        NavigationLink(destination: ResultView(viewModel: viewModel)) {
                            Text("Show Results")
                        }
                    } else {
                        Text("Please insert correct title (ex.: feld1)")
                    }
                }
                
                Spacer(minLength: 50)
            }
            .navigationTitle("Minesweeper Cheat")
        }
        .navigationViewStyle(.stack)
        
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
