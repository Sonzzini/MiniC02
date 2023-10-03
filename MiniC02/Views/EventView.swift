//
//  PostView.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 19/09/23.
//

import SwiftUI

struct EventView: View {
	
	var event: EventModel
	
	var body: some View {
		NavigationStack {
			Text("Hello, World!")
		}
	}
}

#Preview {
	EventView(event: EventModel(title: "Aniversário do Sabaini", desc: "", date: "19/09/2023 (quarta-feira)", time: "19h", location: "Rua Lacerda de Almeida, 130", neighborhood: "Higienópolis", hostname: "sabainigabriel", imagename: "image2"))
}
