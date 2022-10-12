//
//  ContentView.swift
//  VolumeControl
//
//  Created by Marcel Salej on 12/10/2022.
//

import SwiftUI

struct ContentView: View {
    // Property wrappers
    @State private var volumeLevel: String = ""
    @State private var lineNum: String = ""
    @State var lineNumInt: Int = 0
    @State var levelNumberDouble: Double = 0.0
    // MARK: - Main body
    
    var body: some View {
        
        
        VStack {
            InputGroupContentView(enteredText: $volumeLevel, numberOfLines: $lineNum, didEndEditingLevel: {
                // level
                if !volumeLevel.isEmpty && !lineNum.isEmpty {
                    levelNumberDouble = 0
                    lineNumInt = 0
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                        levelNumberDouble = Double(volumeLevel) ?? 0
                        lineNumInt = Int(lineNum) ?? 0
                    }
                }
            }, didEndEditingLines: {
                // lines
                if !lineNum.isEmpty && !volumeLevel.isEmpty {
                    levelNumberDouble = 0
                    lineNumInt = 0
                    
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
                        levelNumberDouble = Double(volumeLevel) ?? 0
                        lineNumInt = Int(lineNum) ?? 0
                    }
                }
            })
            
            GeometryReader { r in
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(alignment: .center, spacing: 15) {
                        let fillToIndex = calculateFillIndex(allLines: lineNumInt, volumeLevel: levelNumberDouble)
                        ForEach((0..<lineNumInt).reversed(), id: \.self) { index in
                            MeterItemButton(isSelected: index < fillToIndex, index: index, didTapButton: { index in
                                calculateFillIndex(for: Double(index), allLines: Double(lineNumInt))
                                
                            }).frame(maxWidth: r.size.width / 2, maxHeight: r.size.height, alignment: .center)
                        }
                    }
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
}
extension  ContentView {
    func calculateFillIndex(for index: Double, allLines: Double) {
        let percentage = ((index/allLines) * 100).rounded()
        levelNumberDouble = 0
        lineNumInt = 0
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            levelNumberDouble = Double(percentage) ?? 0
            lineNumInt = Int(lineNum) ?? 0
        }
    }
    
    func calculateFillIndex(allLines: Int, volumeLevel: Double) -> Int {
        let volumeLevelPercent = Double(volumeLevel / 100)
        let selectionLimitSize = Double(allLines) * volumeLevelPercent
        let selectionLimit = Int(selectionLimitSize)
        return selectionLimit
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
