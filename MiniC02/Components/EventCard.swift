//
//  EventCard.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 02/10/23.
//

import SwiftUI

struct EventCard: View {
	
	var event: EventModel
	var onYourProfile: Bool = false
	
	var body: some View {
		NavigationStack {
			NavigationLink(destination: EventView(event: event)) {
					
					VStack(spacing: 0) {
                        
                        if !onYourProfile {
                            ImageWithName
                                .padding(.vertical, 10)
                                .padding(.horizontal, 5)
                        }
//                        //foto e usuario q eu trouxe
//                        
//                        HStack {
//                            Image(event.hostname)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: 30)
//                            
//                            Text(event.hostname)
//                                .font(.custom("SF-Pro", size: 18))
//                               
//                            
//                            Spacer()
//                        }
						
						eventImage
						
						ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
							
							RoundedCorner(radius: 0, corners: [.bottomLeft, .bottomRight])
								.fill(Color.white)
                                
							
							HStack {
								VStack(alignment: .leading) {
									Text(event.title)
										.font(.title2)
										.fontWeight(.semibold)
									
									Text(event.date + " - " + event.time)
								}
								.padding(.horizontal, 10)
								
								// MARK: Event accessibility tags or whatever the design team is up to
								Spacer()
								
								Image("icon-"+event.acctag)
									.resizable()
									.frame(width: 35, height: 70)
									.padding(.trailing)
							}
                            
						}
                        
						
					}
				.frame(width: 361, height: 300)
                .clipShape(RoundedCorner(radius: 15, corners: [.allCorners]))
                .background(
                    RoundedCorner(radius: 15, corners: [.allCorners])
                        .fill(.white)
                        .shadow(radius: 10)
                )
                
                
				
			}
		}
		.foregroundStyle(.black)
		
    }
}

#Preview {
	EventCard(event: EventModel(title: "Aniversário do Sabaini", desc: "", date: "19/09/2023 (quarta-feira)", time: "19h", location: "Rua Lacerda de Almeida, 130", neighborhood: "Higienópolis", hostname: "sabainigabriel", imagename: "image2", acctag: "1"))
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
			Image(event.hostname)
				.resizable()
				.scaledToFit()
				.frame(height: 30)
			
			Text(event.hostname)
				.font(.custom("SF-Pro", size: 18))
			
			Spacer()
		}
	}
	
	private var eventImage: some View {
		Image(event.imagename)
			.resizable()
			.scaledToFill()
			.frame(width: 361, height: 186)
	}
}
