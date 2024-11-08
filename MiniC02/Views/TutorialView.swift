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
    var tutorialInformation : [String] = ["Seja Bem Vindo(a) \nao Sinale!", "Você poderá ver todos os eventos que a comunidade está organizando e confirmar sua presença!", "Você também pode criar o seu próprio evento e publicá-lo para que amigos e família compareçam.", "Vamos começar nossa jornada!"]
    
	@Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
			  ZStack {
				  if colorScheme == .light {
					  Color("NewPurple")
				  } else {
					  Color("NewDark")
				  }
				  
//				  if indexTutorial == 0 {
					  Image(colorScheme == .light ? "blackgreenblob" : "whitegreenblob")
						  .resizable()
						  .scaledToFit()
						  .frame(width: 150)
						  .position(x: UIScreen.main.bounds.width - 30, y: UIScreen.main.bounds.height - 30)
					  
					  Image(colorScheme == .light ? "blacksemicircle" : "whitesemicircle")
						  .resizable()
						  .scaledToFit()
						  .frame(width: 152)
						  .position(x: 20, y: UIScreen.main.bounds.height - 20)
//				  }
				  
				  TabView {
					  TutorialCore
				  }
				  .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
				  .ignoresSafeArea()
			  }
			  .ignoresSafeArea()
        }
    }
}

extension TutorialView {
    private var TutorialCore: some View {
        NavigationStack {
            VStack {
					
					Spacer()
					
                VStack {
						 if indexTutorial == 0 {
							 Image("LogoIcon")
								 .resizable()
								 .scaledToFit()
								 .frame(width: 180)
								 .padding(26)
						 }
						 
                    Text(tutorialInformation[indexTutorial])
                        .font(Font.custom("SF Pro", size: 36))
                        .fontWeight(.bold)
//                        .fixedSize()
                        .multilineTextAlignment(.center)
                        .kerning(-0.4)
//                        .frame(width: 323)
								.foregroundStyle(.white)
								.padding(.horizontal, 17)
//                        .padding(.bottom, 110)
						 
						 if indexTutorial == 0 {
							 Text("Welcome to Sinale!")
								 .font(Font.custom("SF Pro", size: 16))
								 .fontWeight(.bold)
								 .foregroundStyle(Color.white)
								 .opacity(0.7)
						 }
                }
					 .padding(.bottom, 110)
					
					Spacer()
                
                HStack {
                    ForEach(circleIndex.indices, id: \.self) { index in
                        IndexCircles(indexTutorial: $indexTutorial, circleIndex: circleIndex)
                            .overlay {
                                if circleIndex[index] {
											  if colorScheme == .light {
												  Circle()
														.frame(width: 10)
														.padding(.bottom, 15)
														.foregroundStyle(Color("NewPeach"))
											  } else {
												  Circle()
														.frame(width: 10)
														.padding(.bottom, 15)
														.foregroundStyle(Color("NewPurple"))
											  }
                                    
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
                    .buttonStyle(NewPlainButtonStyle())
                    
                } else {
                    NavigationLink("Continuar") {
                        CadastroView(sheetIsPresented: $sheetIsPresented)
                            .navigationBarBackButtonHidden(true)
                    }
                    .buttonStyle(NewPlainButtonStyle())
                }
            }
				.padding(.bottom, 100)
        }
        .toolbar {
            ToolbarItem(placement: .automatic) {
                NavigationLink("Pular") {
                    CadastroView(sheetIsPresented: $sheetIsPresented)
                        .navigationBarBackButtonHidden(true)
                }
                .font(.custom("SF Pro", size: 17))
					 .tint(Color.white)
            }
        }
    }
}
