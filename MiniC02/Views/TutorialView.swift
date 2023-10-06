//
//  Tutorial1View.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 28/09/23.
//

import SwiftUI

struct TutorialView: View {
	@Binding var sheetIsPresented: Bool
	
	@State var indexTutorial : Int = 0
	var tutorialInformation : [String] = ["Seja Bem Vindo(a) ao \nSinale!", "Você poderá ver todos \n os eventos que a comunidade \n está organizando e confirmar \n sua presença!", "Você também pode criar o seu \n próprio evento e publicá-lo para \n que amigos e pessoas \n compareçam.", "Vamos começar nossa jornada!"]
	
	var body: some View {
		NavigationStack {
			TabView {
				TutorialCore
			}
			.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
			.ignoresSafeArea()
		}
	}
}

extension TutorialView {
    private var TutorialCore: some View {
        NavigationStack {
            VStack {
                VStack {
                    Spacer(minLength: 105)
                    Image("hiLibras")
                        .padding(26)
                    Text(tutorialInformation[indexTutorial])
                        .font(Font.custom("SF Pro", size: 24))
                        .fontWeight(.semibold)
                        .fixedSize()
                        .multilineTextAlignment(.center)
                        .kerning(-0.4)
                        .frame(width: 250, height: 86)
                }
                
                ProgressCircles
                
                if (indexTutorial <= (tutorialInformation.count - 2)) {
                    Button("Continuar") {
                        indexTutorial += 1
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.vertical, 110)
                } else {
                    NavigationLink("Continuar") {
                        CadastroView()
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.vertical, 110)
                }
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                NavigationLink("Pular") {
                    CadastroView()
                        .navigationBarBackButtonHidden(true)
                }
                .font(.custom("SF Pro", size: 17))
                .tint(.black)
            }
        }
    }
    
    private var ProgressCircles: some View {
        HStack {
            ForEach(tutorialInformation.indices, id: \.self) { index in
                Circle()
                    .frame(width: 10)
                
                // .onChange(of: variavel)
                
            }
        }
    }
}



#Preview {
    TutorialView()
}

