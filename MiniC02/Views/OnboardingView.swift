//
//  OnboardingView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 28/09/23.
//

import SwiftUI

struct OnboardingView: View {

	var body: some View {
		ScrollView(.init()) { // Para deixar a view certinha no top edge
			TabView {
                TutorialView()
			}
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
			.ignoresSafeArea()
		}
	}
}


#Preview {
	OnboardingView()
}
