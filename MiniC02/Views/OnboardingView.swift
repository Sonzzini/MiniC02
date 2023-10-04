//
//  OnboardingView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 28/09/23.
//

import SwiftUI

struct OnboardingView: View {
	@State private var tabNumber = 0
	
	var body: some View {
		ScrollView(.init()) { // Para deixar a view certinha no top edge
			TabView {
				TutorialView()
				CadastroView()
			}
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
			.ignoresSafeArea()
		}
	}
}


#Preview {
	OnboardingView()
}
