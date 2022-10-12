//
//  GraySubmitButton.swift
//  VolumeControl
//
//  Created by Marcel Salej on 12/10/2022.
//

import SwiftUI

struct GraySubmitButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(title, action: action)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding([.leading, .trailing], 20)
            .padding([.top, .bottom], 10)
            .foregroundColor(.black)
            .background(Color.gray.opacity(0.2))
            .font(.system(size: 14, weight: .regular, design: .default))
            .cornerRadius(5)
    }
}


#if DEBUG
struct GraySubmitButton_Previews: PreviewProvider {
    static var previews: some View {
        GraySubmitButton(title: "Test", action: {})
    }
}
#endif
