//
//  TagInformationView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 03/10/23.
//
//


import SwiftUI

struct AcessibilityTagInformationView: View {
    @Environment(\.dismiss) var dismiss
    var descTagInfo : [String] = ["O local oferece ajuda e/ou acesso para surdos.", "O local possui sistema de aro magnético e o sistema de som será transmitido no aparelho auditivo ou implante coclear. Basta colocar no modo 'T' (telecoil)..", "No local há alguma forma de tecnologia que fornece acessibilidade.", "A programação televisiva ou um vídeo possui legendas ocultas que podem ser ativadas.", "Legendas que já vêm no vídeo e não podem ser desativadas.", "Aparelho de telefone possui um controle de volume amplificado que pode ser usado por pessoas que possuem perda auditiva leve ou moderada.", "O local possui um telefone para surdos que possui um teclado e visor que permitem enviar e receber mensagens.", "O barulho ambiente é alto demais e pode provocar perda auditiva ou dano.", "Para profissionais intérpretes que trabalham e atuam na comunicação em Libras.", "O local terá pessoas que se comunicam em libras."]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 25) {
                    ForEach(descTagInfo.indices, id: \.self){ index in
                        TagInfoItem()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Acessibilidade")
                    }
                    ToolbarItem {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Ok")
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    AcessibilityTagInformationView()
}
