//
//  EventPostView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 27/09/23.
//
import Foundation
import SwiftUI
import UserNotifications
import Aptabase

struct EventPostView: View {
	
	@EnvironmentObject var vm : ViewModel
	@Environment(\.dismiss) private var dismiss
	
	@State private var date1 = Date()
	@State private var title: String = "" 				// ON
	@State private var desc: String = "" 				// OFF
	@State private var date: String = ""			// ON
	@State private var time: String = "" 				// ON
	@State private var location: String = "" 			// ON
	@State private var neighborhood: String = "" 	// ON
	@State private var hostname: String = ""		// OFF
	@State private var imagename: String = "image1" // OFF
	@State private var selectedAccessibilityTag: AccessibilityTag = .ClosedCaptions
	
	@State var dateRaw = Date.now
	@State var timeRaw = Date.now
	
	@Environment(\.defaultMinListRowHeight) var rowHeight
	@State var sheetIsPresented: Bool = false
	
	@State var imageIsPicked: Bool = false
	
	@EnvironmentObject var eventC: EventCRU
	
	@Environment(\.colorScheme) var colorScheme
	
	init() {
		Aptabase.shared.trackEvent("Abriram a EventPostView")
	}
	
	var body: some View {
		
		NavigationStack {
			ScrollView {
				VStack(alignment: .leading) {
					
//					Text("COLOQUE UMA FOTO/VÍDEO!")
//						.foregroundStyle(.secondary)
//						.font(.footnote)
//						.padding(.leading, 40)
//						.padding(.top)
					
					HStack {
						Spacer()
						VStack {
							ImageSelector
							Text("Adiciona uma foto ou vídeo!")
								.foregroundStyle(Color("NewTextFormColor"))
						}
						Spacer()
					}
					.padding(.top)
					
					Form {
						Section {
							TextField("Nome do seu Evento *", text: $title)
							
							DatePicker (
								"Dia",
								selection: $dateRaw,
								displayedComponents: [.date]
							)
							.foregroundStyle(Color.secondary.opacity(0.5))
							
							DatePicker (
								"Horário",
								selection: $timeRaw,
								displayedComponents: [.hourAndMinute]
							)
							.foregroundStyle(Color.secondary.opacity(0.5))
							
							TextField("Local *", text: $location)
							TextField("Bairro *", text: $neighborhood)
						}
						.listRowBackground(Color("NewFormColor"))
						
						
						
						Section {
							
							Picker("", selection: $selectedAccessibilityTag) {
								ForEach(AccessibilityTag.allCases, id: \.self) {
									Text($0.label)
								}
							}
						} header: {
							Text("Selecione as Acessibilidades do evento:")
								.fontWeight(.semibold)
						}
						.listRowBackground(Color("NewFormColor"))
						
						Section {
							
							TextField("Descrição *", text: $desc, axis: .vertical)
								.textFieldStyle(.plain)
								.lineLimit(3...5)
							
						} header: {
							Text("Adicione uma descrição do evento: ")
								.fontWeight(.semibold)
						}
						.listRowBackground(Color("NewFormColor"))
					}
					//😞👍
					.scrollContentBackground(.hidden)
					.scrollDisabled(true)
					
					.onAppear {
						self.hostname = vm.profiles[0].username ?? "sabainigabriel"
					}
					.frame(height: rowHeight * 15)
					
					.navigationBarBackButtonHidden(true)
					.toolbar {
						ToolbarItem(placement: .principal) {
							Text("Novo Evento")
								.font(
									Font.custom("SF Pro", size: 20)
										.weight(.semibold)
								)
								.foregroundStyle(Color(colorScheme == .light ? .black : .white))
						}
						ToolbarItem(placement: .confirmationAction) {
							Button (action: {
								print("\(formatDate(rawdate: dateRaw))")
								let event = EventModel(
									title: title,
									desc: desc,
									date: formatDate(rawdate: dateRaw),
									time: formatTime(rawTime: timeRaw),
									location: location,
									neighborhood: neighborhood,
									hostname: hostname,
									imagename: imagename,
									acctag:  selectedAccessibilityTag)
								
								Aptabase.shared.trackEvent("Enviaram o evento")
								
								
								eventC.postEvent(event: event)
								dismiss()
							}, label: {
								Text("Criar")
									.font(.custom("SF Pro", size: 16))
									.foregroundStyle(buttonIsDisabled() ? Color("NewPeach").opacity(0.5) : Color("NewPeach"))
							})
							.disabled(buttonIsDisabled())
						}
						ToolbarItem(placement: .cancellationAction) {
							Button {
								dismiss()
							} label: {
								HStack {
									Image(systemName: "chevron.left")
									Text("Início")
								}
								.foregroundStyle(Color("NewPeach"))
							}
							
							
						}
					}
				}
//				.background(
//					Color.secondary.opacity(0.1)
//				)
				
			}
			.scrollDisabled(true)
			.background(
				Image(colorScheme == .light ? "lightCreateEventBackground" : "darkCreateEventBackground")
			)
			
			.sheet(isPresented: $sheetIsPresented) {
				ImagePickSheetView(imageIsPicked: $imageIsPicked, imageName: $imagename)
					.presentationDragIndicator(.visible)
			}
		}
		
		
		
		
		
		
	}
	
}


extension EventPostView {
	
	private var ImageSelector: some View {
		
		Button(action: {
			sheetIsPresented.toggle()
			
		}, label: {
			if !imageIsPicked {
				VStack {
					Image(systemName: "plus")
					Text("Imagem")
						.fontWeight(.regular)
						.font(.system(size: 12))
				}
					.padding(30)
					.padding(.vertical, 5)
					.background(
						Color("NewFormColor")
							.clipShape(RoundedRectangle(cornerRadius: 12))
					)
					.foregroundStyle(Color("NewPeach"))
			} else {
				Image(imagename)
					.resizable()
					.scaledToFit()
					.frame(width: 360)
					.clipShape(RoundedRectangle(cornerRadius: 12))
			}
		})
		
		
	}
	
	func formatDate(rawdate: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/yyyy"
		return dateFormatter.string(from: rawdate)
	}
	
	func formatTime(rawTime: Date) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "HH:mm"
		return dateFormatter.string(from: rawTime)
	}
	
	func buttonIsDisabled() -> Bool {
		if title == "" || desc == "" || neighborhood == "" || location == "" {
			return true
		}
		return false
	}
}


