//
//  TagView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 03/10/23.
//

import SwiftUI

struct TagButton: Identifiable {
    let id = UUID()
    var nome: String
    var togle = false
}

struct TagView: View {
    var name: String
    let columns = [
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)]
    
    @State private var tags: [String] = []
    @State private var isSelected = false

    @State private var showingSheet = false
    @EnvironmentObject var vm : ViewModel
    
    var TagIdentifiers: [String] = ["Bilíngue", "Sinalizado", "Oralizado", "Leitura Labial", "Intérprete", "Trilíngue", "Implante Coclear", "Profissional da Saúde", "Simpatizante"]
    var TagHobbies: [String] = ["Esportes", "Artes", "Pets", "Jogos", "Animes", "Festas", "Comida", "Exercício", "Investimento", "Livros", "Música", "Podcast", "Tecnologia", "Parque", "Teatro", "Rede Social", "Viagem", "Religião"]
    
    var body: some View {
        NavigationStack {
            VStack {
                
                TagViewHeader
                
                ScrollView(.vertical) {
                    LazyVGrid(columns: columns, alignment: .center) {
                        ForEach(TagIdentifiers.indices, id: \.self) { index in
                            TagButtonView(string: TagIdentifiers[index])
                                .onTapGesture {
                                    tags.append(TagIdentifiers[index])
                                }

                        }
                    }
                    .padding()
                }
                
                Button("Continuar") {
                    // MARK: mudar as tags para as tags la de cima, e nao hardcoded
                    vm.setupProfile(name: name, tags: tags) // no caso, essas tags são as que o usuário selecionou
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
