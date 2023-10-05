//
//  TagView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 03/10/23.
//

import SwiftUI

struct TagView: View {
    var name: String
    
    @State private var tags: [Int] = []
    @State private var isSelected = false
    @State private var showingSheet = false
    @EnvironmentObject var vm : ViewModel
    
    var TagIdentify: [String] = ["Bilíngue", "Sinalizado", "Oralizado", "Leitura Labial", "Intérprete", "Trilíngue", "Implante Coclear", "Profissional da Saúde", "Simpatizante"]
    
    var TagHobbies: [String] = ["Esportes", "Artes", "Pets", "Jogos", "Animes", "Festas", "Comida", "Exercício", "Investimento", "Livros", "Música", "Podcast", "Tecnologia", "Parque", "Teatro", "Rede Social", "Viagem", "Religião"]
    
//    enum TagNames: String {
//        case one = "Bilíngue"
//        case two = "Sinalizado"
//        case Oralizado = 3
//        case LeituraLabial =
//    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                TagViewHeader
                
                Button("Bilíngue") {
                    isSelected.toggle()
                }
                .buttonStyle(PlainTagStyle(isSelected: $isSelected))
                .padding(.bottom, 147)
                
                Button("Continuar") {
                    // MARK: mudar as tags para as tags la de cima, e nao hardcoded
                    vm.setupProfile(name: name, tags: [1, 2, 3]) // no caso, essas tags são as que o usuário selecionou 
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
}

extension TagView {
    private var TagViewHeader: some View {
        VStack {
            Image("hiLibras")
                .resizable()
                .frame(width: 129, height: 134.7)
                .padding(.bottom, 24)
            
            Text("Selecione as tags que você se identifica:")
                .font(.custom("SF Pro", size: 19))
                .fontWeight(.semibold)
                .padding(.bottom, 30)
            
            Text("Essas tags irão aparecer em seu perfil")
                .font(.custom("SF Pro", size: 16))
                .fontWeight(.semibold)
                .foregroundStyle(Color("DarkGray"))
                .padding(.bottom, 25)
        }
    }
}

#Preview {
    TagView(name: "Paulo Sonzzini")
}
