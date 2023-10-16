//
//  PostView.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 19/09/23.
//

import SwiftUI

struct EventView: View {
	
	var event: EventModel
	@Binding var salvo: Bool
	@Binding var confirmed: Bool
	@State private var oneOpen: Bool = false
	@State private var twoOpen: Bool = false
	@State var showingInfoView: Bool = false
	@State var tag: AccessibilityTag
	
	@Environment(\.dismiss) private var dismiss
	
	@EnvironmentObject var vm : ViewModel
	
	var body: some View {
		NavigationStack {
			ScrollView{
				
				VStack(alignment: .leading){
					Image(event.imagename)
						.resizable()
						.scaledToFit()
					
					VStack(alignment: .leading){
						
						EventHeaderWithSave
						
						Text(event.title)
							.font(Font.custom("SF Pro", size: 28))
							.padding(.top, 14)
							.bold()
						
						EventDescription
							.padding(.vertical)
						
						EventAcessibility
						
						
						EventInfo
							.padding(.vertical)
						
						
						
						Button {
							
							if !confirmed {
								vm.saveConfirmedEventToProfile(event: event)
							} else if confirmed {
								vm.unsaveConfirmedEventFromProfile(event: event)
							}
							
							confirmed.toggle()
							
						} label: {
							if !confirmed {
								Text("Eu vou")
							} else {
								Text("Confirmado!")
							}
						}
						.buttonStyle(PlainButtonStyle())
						.padding(.vertical, 20)
						
					}
					.padding(.leading, 14)
					
				}
			}
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button(action: {
						dismiss()
					}, label: {
						HStack {
							Image(systemName: "chevron.left")
							Text("Início")
						}
					})
					.foregroundStyle(Color("DarkBlue"))
				}
			}
		}
		.navigationBarBackButtonHidden(true)
	}
}

//#Preview {
//    EventView(event: EventModel(title: "Aniversário do Sabaini", desc: "", date: "19/09/2023 (quarta-feira)", time: "19h", location: "Rua Lacerda de Almeida, 130", neighborhood: "Higienópolis", hostname: "sabainigabriel", imagename: "image2", acctag: .ClosedCaptions))
//}

extension EventView {
	
	private var EventHeaderWithSave: some View {
		HStack{
			Image(event.hostname)
			
			Text(event.hostname)
				.font(Font.custom("SF Pro", size: 17))
				.foregroundStyle(Color("MainTextColor"))
			
			Spacer()
			
			Button {
				
				if !salvo {
					vm.saveEventToProfile(event: event)
				}
				else if salvo {
					vm.unsaveEventFromProfile(event: event)
				}
				
				withAnimation(.linear(duration: 0.3)) {
					salvo.toggle()
				}
				
			} label: {
				
				
				if salvo{
					Image(systemName: "bookmark.fill")
						.font(.title2)
						.padding(.trailing, 14)
						.foregroundColor(Color("DarkYellow"))
				}
				else {
					Image(systemName: "bookmark")
						.font(.title2)
						.padding(.trailing, 14)
						.foregroundColor(Color("DarkYellow"))
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
			
			HStack{
				Image(systemName: "calendar")
					.foregroundStyle(Color("DarkBlue"))
				
				Text(event.date)
					.foregroundStyle(Color("MainTextColor"))
				Image(systemName: "clock")
					.foregroundStyle(Color("DarkBlue"))
				
				Text(event.time)
					.foregroundStyle(Color("MainTextColor"))
			}
			.padding(.vertical)
			HStack{
				Image(systemName: "mappin")
					.foregroundStyle(Color("DarkBlue"))
				
				Text(event.location + " - " + event.neighborhood)
					.foregroundStyle(Color("MainTextColor"))
			}
		}
		.padding(.top)
	}
	
	private var EventDescription: some View {
		VStack(alignment: .leading) {
			Text("Descrição")
				.font(Font.custom("SF Pro Text", size: 17)
					.weight(.semibold))
				.foregroundColor(Color("DarkGray"))
				.padding(.bottom, 5)
			
			Text(event.desc)
				.font(Font.custom("SF Pro", size: 17))
				.foregroundStyle(Color("MainTextColor"))
		}
	}
	
	private var EventAcessibility: some View {
		VStack(alignment: .leading){
			HStack{
				Text("Acessibilidade")
					.foregroundColor(Color("DarkGray"))
				Button {
					print("informacoes")
					showingInfoView.toggle()
					
				} label: {
					Image(systemName: "info.circle.fill")
						.tint(Color("DarkBlue"))
				}
				.sheet(isPresented: $showingInfoView){
					AcessibilityTagInformationView()
				}
			}
			HStack{
				Image(event.acctag.rawValue)
					.resizable()
					.frame(width: 48, height: 47)
			}
		}
	}
}
