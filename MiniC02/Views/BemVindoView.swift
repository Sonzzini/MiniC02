//
//  Tutorial1View.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 28/09/23.
//

import SwiftUI

struct BemVindoView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    VStack {
                        Spacer(minLength: 105)
                        Image("hiLibras")
                            .padding(26)
                        Text("Seja Bem-Vindo(a) ao Sinale!")
                            .font(.custom("SF-Pro-Text-Bold", size: 20))
                            .bold()
                            
                    }
                    Button("Continuar") {
                        print("aaa")
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.vertical, 110)
                }
                .toolbar {
                    ToolbarItem(placement: .automatic) {
                        NavigationLink("Pular") {
                            CadastroView()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    BemVindoView()
}
