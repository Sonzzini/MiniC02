//
//  PlainButton.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 25/09/23.
//

import SwiftUI

struct PlainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 361, height: 44)
            .font(.custom("SF-Pro-Text-Bold", size: 20))
            .background(configuration.isPressed ? Color("LightBlue"): Color("DarkBlue"))
            .cornerRadius(8)
    }
}

struct PlainButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        Button {
            print("aaaAAaaa")
        } label: {
            Text("Continuar")
        }
        .buttonStyle(PlainButtonStyle())
    }
}
