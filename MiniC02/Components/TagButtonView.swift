//
//  TagButtonView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 06/10/23.
//

import SwiftUI

struct TagButtonView: View {
    
    @State var isToggled: Bool = false
    var string: String
    
    var body: some View {
        
        Button(action: {
            isToggled.toggle()
        }, label: {
            Text(string)
        })
        .buttonStyle(PlainTagStyle(isSelected: $isToggled))
    }
}


