//
//  CadastroView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 29/09/23.
//

import SwiftUI

struct CadastroView: View {
    @State private var name = ""
    var body: some View {
        VStack {
            Image("hiLibras")
                .resizable()
                .frame(width: 129, height: 134.7)
                .padding(.bottom, 24)
            
            Text("Vamos começar, qual é o seu nome?")
                .font(.custom("SF-Pro", size: 19))
                .padding(.bottom, 35)
            
            TextField("Seu Nome", text: $name)
                .font(.custom("SF-Pro", size: 28))
                .fixedSize()
                .fontWeight(.bold) // não fica em bold :(((((((
                .padding(.horizontal, 131)
            
            Button("Continuar") {
                print("aa")
            }
            .buttonStyle(PlainButtonStyle())
            .padding(.top, 357)
        }
    }
}

#Preview {
    CadastroView()
}
