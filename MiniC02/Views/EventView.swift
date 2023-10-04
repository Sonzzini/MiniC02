//
//  PostView.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 19/09/23.
//

import SwiftUI

struct EventView: View {
	
	var event: EventModel
	@State var salvo: Bool = false
	
	var body: some View {
		NavigationStack {
			ScrollView{
				
				VStack(alignment: .leading){
					Image(event.imagename)
						.resizable()
					
					VStack(alignment: .leading){
						
						EventHeaderWithSave
						
						Text(event.title)
							.font(Font.custom("SF Pro", size: 28))
							.padding(.top, 14)
                            .bold()
						
						EventDescription
                            .padding(.vertical)
						
						EventInfo
                            .padding(.vertical)

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

extension EventView {
	
	private var EventHeaderWithSave: some View {
		HStack{
			Image(event.hostname)
			
			Text(event.hostname)
				.font(Font.custom("SF Pro", size: 17))
			Spacer()
			
			Button {
				print("funcionando")
				
				withAnimation(.linear(duration: 0.3)) {
					salvo.toggle()
				}
				
			} label: {
				
				
				if salvo{
					Image(systemName: "bookmark.fill")
						.font(.title)
						.padding(.trailing, 14)
						.foregroundColor(Color(red: 1, green: 0.79, blue: 0.25))
				}
				else {
					Image(systemName: "bookmark")
						.font(.title)
						.padding(.trailing, 14)
						.foregroundColor(Color(red: 1, green: 0.79, blue: 0.25))
				}
				
			}
		}
		.padding(.bottom, 0)
	}
	
	private var EventInfo: some View {
		VStack(alignment: .leading) {
			Text("Informações")
				.font(Font.custom("SF Pro Text", size: 17)
					.weight(.semibold))
				.foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
			
			// MARK: bagulho dos designers
			HStack{
				Image(systemName: "")
				Text("Intérpretes e legendas")
			}
			// MARK: Acaba bagulho
			
			HStack{
				Image(systemName: "calendar")
				Text(event.date)
				Image(systemName: "clock")
				Text(event.time)
			}
			
			HStack{
				Image(systemName: "mappin")
				Text(event.location + " - " + event.neighborhood)
			}
		}
	}
	
	private var EventDescription: some View {
		VStack(alignment: .leading) {
			Text("Descrição")
				.font(Font.custom("SF Pro Text", size: 17)
					.weight(.semibold))
				.foregroundColor(Color(red: 0.59, green: 0.59, blue: 0.59))
				.padding(.top)
				.padding(.bottom, 5)
			
			Text(event.desc)
				.font(Font.custom("SF Pro", size: 17))
		}
	}
}
