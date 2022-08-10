//
//  ContentView.swift
//  MineSweeperSolver
//
//  Created by Sebastian Birchner on 10.08.22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear(perform: {
                FileWriter().printResults(sourceTitle: "feld1")
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
