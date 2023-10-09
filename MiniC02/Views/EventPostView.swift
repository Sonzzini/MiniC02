//
//  EventPostView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 27/09/23.
//

import SwiftUI

struct EventPostView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = "" 				// ON
    @State private var desc: String = "" 				// OFF
    @State private var date: String = "" 				// ON
    @State private var time: String = "" 				// ON
    @State private var location: String = "" 			// ON
    @State private var neighborhood: String = "" 	// ON
    @State private var hostname: String = "" 			// OFF
    @State private var imagename: String = "image1" // OFF
    @State private var acctag: String = "1" 			// OFF
    @State private var selectedAccessibilityTag: AccessibilityTag = .ClosedCaptions
    
    @EnvironmentObject var eventC: EventCRU
    
    var body: some View {
        NavigationStack {
            Form {
                
                Section {
                    Button(action: {
                        print("AAAAAA")
                    }, label: {
                        Image(systemName: "plus")
                    })
                } header: {
                    Text("Coloque uma foto/vídeo!")
                }
                
                Section {
                    TextField("Nome do seu Evento", text: $title)
                    TextField("Data", text: $date)
                    TextField("Horário", text: $time)
                    TextField("Local", text: $location)
                    TextField("Bairro", text: $neighborhood)
                } header: {
                    Text("Informações")
                }
                
                Section {
                    
                    Picker("Tag de Acessibilidade:", selection: $selectedAccessibilityTag) {
                        ForEach(AccessibilityTag.allCases, id: \.self) {
                            Text($0.label)
                        }
                    }
                }
                    
//                                        Picker("Tag de Acessibilidade:", selection: $acctag) {
//                                            ForEach(tags, id: \.self) {
//                                               Text($0)
//                                            }
//                                       }
//                }
                //            header: {
                //                Text("Selecione as acessibilidades do evento:")
                //            }
                
                Section {
                    
                    TextField("Descrição", text: $desc)
                        .textFieldStyle(.plain)
                    
                } header: {
                    Text("Adicione uma descrição do evento: ")
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Novo Evento")
                        .font(
                            Font.custom("SF Pro", size: 20)
                                .weight(.semibold)
                        )
                        .foregroundStyle(Color("DarkYellow"))
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Criar") {
                        let event = EventModel(
                            title: title,
                            desc: desc,
                            date: date,
                            time: time,
                            location: location,
                            neighborhood: neighborhood,
                            hostname: hostname,
                            imagename: imagename,
                            acctag: acctag)
                        
                        eventC.postEvent(event: event)
                        dismiss()
                    }
                }
            }
        }
        
    }
}

#Preview {
    EventPostView()
        .environmentObject(EventCRU())
}
