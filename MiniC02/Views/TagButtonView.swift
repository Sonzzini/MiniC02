//
//  TagButtonView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 02/10/23.
//

import SwiftUI

struct TagButtonView: View {
    @State var isSelected: Bool = false
    var body: some View {
        VStack {
            if isSelected {
                Text("aaaaa")
            } else {
                Text("eeeee")
            }
        }
    }
    
    
}

#Preview {
    TagButtonView()
}
