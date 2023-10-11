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
    @State var circleIndex: [Bool] = [false, false, false, false]
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
                    Image("hiLibras")
                        .padding(26)
                    Text(tutorialInformation[indexTutorial])
                        .font(Font.custom("SF Pro", size: 24))
                        .fontWeight(.semibold)
                        .fixedSize()
                        .multilineTextAlignment(.center)
                        .kerning(-0.4)
                        .frame(width: 250, height: 86)
                        .padding(.bottom, 110)
                }
                
                HStack {
                    ForEach(circleIndex.indices, id: \.self) { index in
                        IndexCircles(indexTutorial: $indexTutorial, circleIndex: circleIndex)
                            .overlay {
                                if circleIndex[index] {
                                    Circle()
                                        .frame(width: 10)
                                        .padding(.bottom, 15)
                                        .foregroundStyle(Color("DarkBlue"))
                                }
                            }
                    }
                }
                .onAppear {
                    circleIndex[0].toggle()
                    
                }
                
                if (indexTutorial <= (tutorialInformation.count - 2)) {
                    Button("Continuar") {
                        indexTutorial += 1
                        circleIndex[indexTutorial].toggle()
                        if indexTutorial > 1 {
                            circleIndex[indexTutorial-1].toggle()
                        }
                        if indexTutorial > 0 && indexTutorial == 1 {
                            circleIndex[0].toggle()
                        }
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                } else {
                    NavigationLink("Continuar") {
                        CadastroView(sheetIsPresented: $sheetIsPresented)
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                NavigationLink("Pular") {
                    CadastroView(sheetIsPresented: $sheetIsPresented)
                        .navigationBarBackButtonHidden(true)
                }
                .font(.custom("SF Pro", size: 17))
                .tint(.black)
            }
        }
    }
}
