//
//  EventCard.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 02/10/23.
//

import SwiftUI

struct EventCard: View {
	
	var event: EventModel
	@State var salvo: Bool = false
	var onYourProfile: Bool = false
	
	let profilePicNames = ["biamoura_oficial", "Gabriel Fonseca", "gabrielk29", "Paulo Sonzzini", "paulosonzzini", "sabainigabriel"]
	@State var isInPFPNames = false
	
	@State var EuVou: Bool = false
	
	var body: some View {
		NavigationStack {
			NavigationLink(destination: EventView(event: event, salvo: $salvo, confirmed: $EuVou, tag: event.acctag)) {
				
					VStack(spacing: 0) {
						
						HStack {
							if !onYourProfile {
								ImageWithName
									.padding(.vertical, 10)
									.padding(.horizontal, 5)
							}
							
							Spacer()
							
							if salvo {
								Image(systemName: "bookmark.fill")
									.foregroundStyle(.yellow)
									.padding(.trailing)
							}
							else if EuVou {
								Image(systemName: "checkmark.circle.fill")
									.foregroundStyle(Color("DarkBlue"))
									.padding(.trailing)
							}
							
						}

						
						eventImage
						
						ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
							
							RoundedCorner(radius: 10, corners: [.bottomLeft, .bottomRight])
								.fill(Color("BG"))
								.shadow(color: Color("BG"), radius: 5, x: 0, y: 5)
							
							HStack {
								VStack(alignment: .leading) {
									Text(event.title)
                                        .foregroundStyle(Color("MainTextColor"))
										.font(.title2)
										.fontWeight(.semibold)
									
									Text(event.date + " - " + event.time)
                                        .foregroundStyle(Color("MainTextColor"))
								}
								.padding(.horizontal, 10)
								
								// MARK: Event accessibility tags or whatever the design team is up to
								Spacer()
								
								Image(event.acctag.rawValue)
									.resizable()
									.frame(width: 35, height: 35)
									.padding(.trailing)
							}
							
						}
						
						
					}
                    .background(Color("BG"))
					.frame(width: 361, height: 300)
					.clipShape(RoundedCorner(radius: 15, corners: [.allCorners]))
					.background(
						RoundedCorner(radius: 15, corners: [.allCorners])
							.fill(.white)
							.shadow(radius: 5)
					)
					
					
					
				
			}
			.foregroundStyle(.black)
			
		}
	}
}

#Preview {
    EventCard(event: EventModel(title: "Aniversário do Sabaini", desc: "", date: "19/09/2023 (quarta-feira)", time: "19h", location: "Rua Lacerda de Almeida, 130", neighborhood: "Higienópolis", hostname: "sabainigabriel", imagename: "image2", acctag: .ClosedCaptions))
}




extension View {
	func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
		clipShape(RoundedCorner(radius: radius, corners: corners))
	}
}
struct RoundedCorner: Shape {
	var radius: CGFloat = .infinity
	var corners: UIRectCorner = .allCorners
	
	func path(in rect: CGRect) -> Path {
		let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
		return Path(path.cgPath)
	}
}



extension EventCard {
	private var ImageWithName: some View {
		HStack {
			if isInPFPNames {
				Image(event.hostname)
					.resizable()
					.scaledToFit()
					.frame(height: 30)
					.clipShape(Circle())
			} else {
				Image(systemName: "person.fill")
					.resizable()
					.scaledToFit()
					.frame(height: 20)
					.padding(5)
					.clipShape(Circle())
			}
			
			Text(event.hostname)
                .foregroundStyle(Color("MainTextColor"))
				.font(.custom("SF-Pro", size: 20))
                
			
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
			.frame(width: 361, height: 186)
	}
}
