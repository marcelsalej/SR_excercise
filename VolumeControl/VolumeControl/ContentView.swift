//
//  ContentView.swift
//  VolumeControl
//
//  Created by Marcel Salej on 12/10/2022.
//

import SwiftUI

struct ContentView: View {
    @State var volumeLevel: String = ""
    @State var lineNum: String = ""

    var body: some View {
        VStack {
            InputGroupContentView(enteredText: $volumeLevel, numberOfLines: $lineNum, didEndEditingLevel: {
                // level
                print("Level to set \(volumeLevel)")
            }, didEndEditingLines: {
                // lines
                print("Line to set \(lineNum)")
                
            })
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
