//
//  InputTextField.swift
//  VolumeControl
//
//  Created by Marcel Salej on 12/10/2022.
//

import SwiftUI

struct InputTextField: View {
    @Binding var enteredText: String
    @State var lineColor: Color = .gray.opacity(0.2)
    
    let placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $enteredText, onEditingChanged: { didBeginEditing in
            self.lineColor = didBeginEditing ? Color.red : Color.gray.opacity(0.2)
            
        })
        .underline(true, pattern: .solid, color: lineColor)
    }
}


#if DEBUG
struct InputTextField_Previews: PreviewProvider {
    @State static var enteredTextString: String = ""
    
    static var previews: some View {
        InputTextField(enteredText: $enteredTextString, placeholder: "Enter volume")
    }
}
#endif
