//
//  NewEventCard.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 05/06/24.
//

import Foundation
import SwiftUI

struct NewEventCard: View {
	
	var event: EventModel
	@State var salvo: Bool = false
	var onYourProfile: Bool = false
	
	let profilePicNames = ["biamoura_oficial", "Gabriel Fonseca", "gabrielk29", "Paulo Sonzzini", "paulosonzzini", "sabainigabriel"]
	@State var isInPFPNames = false
	
	@State var EuVou: Bool = false
	
	@Environment(\.colorScheme) var colorScheme
	
	var body: some View {
		NavigationStack {
			NavigationLink(destination: EventView(event: event, salvo: $salvo, confirmed: $EuVou, tag: event.acctag, isInPFPNames: isInPFPNames))  {
				ZStack {
					
					RoundedRectangle(cornerRadius: 12)
						.foregroundStyle(.black)
						.offset(x: 5, y: 6)
					
					VStack {
						eventImage
							.clipShape(RoundedRectangle(cornerRadius: 12))
						
						VStack(alignment: .leading) {
							ImageWithName
							
							Text(event.title)
								.foregroundStyle(colorScheme == .light ? Color.black : Color.white)
								.fontWeight(.bold)
								.font(.custom("Inter-Regular", size: 20))
								.padding(.bottom, 5)
							
							
							HStack {
								Text(event.date)
								Text(event.time)
							}
							.foregroundStyle(Color.gray)
							.padding(.bottom, 10)
							.font(.custom("Inter-Regular", size: 16))
							
							HStack {
								Text("Marcar presença")
									.font(.custom("Inter-Regular", size: 18))
									.fontWeight(.bold)
								Image(systemName: "arrow.right")
							}
							.foregroundStyle(Color("NewPeach"))
							
						}
						.padding(.horizontal, 25)
					}
					.padding(.vertical)
					.background(colorScheme == .light ? Color.white : Color("NewCardDark"))
					.clipShape(RoundedRectangle(cornerRadius: 12))
					
				}
				.frame(width: 359, height: 315)
				.overlay {
					RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 4)
						.foregroundStyle(.black)
				}
			}
		}
		
	}
}

#Preview {
	NewEventCard(event: EventModel(title: "Aniversário do Sabaini", desc: "", date: "19/09/2023 (quarta-feira)", time: "19h", location: "Rua Lacerda de Almeida, 130", neighborhood: "Higienópolis", hostname: "sabainigabriel", imagename: "image1", acctag: .ClosedCaptions))
}



extension NewEventCard {
	private var ImageWithName: some View {
		HStack {
			if isInPFPNames {
				Image(event.hostname)
					.resizable()
					.scaledToFit()
					.frame(height: 30)
					.clipShape(Circle())
					.overlay {
						Circle().stroke(lineWidth: 2.7)
							.fill(colorScheme == .light ? Color.black : Color.white)
					}
			} else {
				Image(systemName: "person.fill")
					.resizable()
					.scaledToFit()
					.frame(height: 20)
					.padding(5)
					.clipShape(Circle())
					.foregroundStyle(Color("DarkBlue"))
			}
			
			Text("@\(event.hostname)")
				.foregroundStyle(Color.gray)
				.font(.custom("Inter-Regular", size: 18))
			
			
			Spacer()
		}
		.onAppear {
			for img in profilePicNames {
				if img == event.hostname {
					isInPFPNames = true
				}
			}
		}
	}
	
	private var eventImage: some View {
		Image(event.imagename)
			.resizable()
			.scaledToFill()
			.frame(width: 330, height: 146)
	}
}
