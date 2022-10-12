//
//  InputGroup.swift
//  VolumeControl
//
//  Created by Marcel Salej on 12/10/2022.
//

import SwiftUI

struct InputGroupContentView: View {
    // Property wrappers
    @Binding var enteredText: String
    @Binding var numberOfLines: String
    
    // Button callbacks
    var didEndEditingLevel: (() -> Void)?
    var didEndEditingLines: (() -> Void)?
    
    // MARK: - Main body
    
    var body: some View {
        VStack(spacing: 10.0) {
            HStack(alignment: .top, spacing: 10) {
                InputTextField(enteredText: $enteredText, placeholder: "Enter volume level")
                GraySubmitButton(title: "Set volume".uppercased()) {
                    didEndEditingLevel?()
                }.frame(minWidth: 0, maxWidth: .infinity)
            }.frame(minWidth: 0, maxWidth: .infinity)
            HStack {
                InputTextField(enteredText: $numberOfLines, placeholder: "Enter num of lines")
                GraySubmitButton(title: "Set lines".uppercased()) {
                    didEndEditingLines?()
                }.frame(minWidth: 0, maxWidth: .infinity)
            }
        }.padding(10)
    }
}

// MARK: - Preview

#if DEBUG
struct InputGroupContentView_Previews: PreviewProvider {
    @State static var enteredTextString: String = ""
    @State static var numberOfLinesString: String = "30"
    static var previews: some View {
        InputGroupContentView(enteredText: $enteredTextString, numberOfLines: $numberOfLinesString)
    }
}
#endif
