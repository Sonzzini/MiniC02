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
            VStack {
                VStack {
                    Spacer(minLength: 105)
                    Image("hiLibras")
                        .padding(26)
                    Text(tutorialInformation[0])
                        .font(Font.custom("SF Pro", size: 24))
                        .fontWeight(.semibold)
                        .fixedSize()
                        .multilineTextAlignment(.center)
                        .kerning(-0.4)
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
                            .navigationBarBackButtonHidden(true)
                    }
                    .font(.custom("SF Pro", size: 17))
                    .tint(.black)
                    
                }
            }
            
        }
    }
}

#Preview {
    BemVindoView()
}
