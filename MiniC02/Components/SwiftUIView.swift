//
//  SwiftUIView.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 19/09/23.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        Button("Continuar") {
            print("oi")
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
