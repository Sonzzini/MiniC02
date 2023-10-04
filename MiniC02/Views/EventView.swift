//
//  PostView.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 19/09/23.
//

import SwiftUI

struct EventView: View {
    
    var event: EventModel
//    var salvo: Bool
    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(alignment: .leading){
                    Image ("image2")
                        .resizable()
                    VStack(alignment: .leading){
                        HStack{
                            Image("sabainigabriel")
                            
                            Text("sabainigabriel")
                                .font(Font.custom("SF Pro", size: 17))
                            Spacer()
                            Button {
                                print("funcionando")
                            } label: {
//                                if salvo{
//                                    Image(systemName: "bookmark.fill")
//                                        .font(.title)
//                                        .padding(.trailing, 14)
//                                        .foregroundColor(Color(red: 1, green: 0.79, blue: 0.25))
//                                }
//                                else{
                                    Image(systemName: "bookmark")
                                        .font(.title)
                                        .padding(.trailing, 14)
                                        .foregroundColor(Color(red: 1, green: 0.79, blue: 0.25))
//                                }
                            }
                        }
                        .padding(.bottom, 0)
                        Text("Aniversário do Sabaini")
                            .font(Font.custom("SF Pro", size: 28))
                            .padding(.top, 14)
                        
                        Text("Descrição")
                            .font(Font.custom("SF Pro Text", size: 17)
                                .weight(.semibold))
                            .foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
                            .padding(.top, 27)
                            .padding(.bottom, 10)

                        Text("Venha celebrar o meu aniversário em uma festa cheia de alegria, música... ")
                            .font(Font.custom("SF Pro", size: 17))
                        
                        Text("Informações")
                            .font(Font.custom("SF Pro Text", size: 17)
                                .weight(.semibold))
                            .foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
                        
                        HStack{
                            Image(systemName: "")
                            Text("Intérpretes e legendas")
                        }
                        HStack{
                            Image(systemName: "calendar")
                            Text("19/09/23")
                            Image(systemName: "clock")
                            Text("19h")
                        }
                        HStack{
                            Image(systemName: "mappin")
                            Text("Rua Lacerda de Almeida, 130 - Higienópolis ")
                        }
                        Button("Eu vou") {
                            print("eu vou")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.vertical, 110)
                    }
                    .padding(.leading, 14)
                    
                }
            }
        }
    }
}
    
    #Preview {
        EventView(event: EventModel(title: "Aniversário do Sabaini", desc: "", date: "19/09/2023 (quarta-feira)", time: "19h", location: "Rua Lacerda de Almeida, 130", neighborhood: "Higienópolis", hostname: "sabainigabriel", imagename: "image2"))
    }

