//
//  MeterItemButton.swift
//  VolumeControl
//
//  Created by Marcel Salej on 12/10/2022.
//

import SwiftUI

struct MeterItemButton: View {
    @State var isSelected: Bool = false
    var index: Int = 0
    
    var didTapButton: ((Int) -> Void)?
    
    var body: some View {
        Button(action: {
            didTapButton?(index)
        }) {
            Text("").padding()
        }
        .frame(minWidth: 100, maxWidth: .infinity, maxHeight: 15)
        .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
            
    }
}


#if DEBUG
struct MeterItemButton_Previews: PreviewProvider {
    static var previews: some View {
        MeterItemButton()
    }
}
#endif
