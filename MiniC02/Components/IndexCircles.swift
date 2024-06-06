//
//  IndexCircles.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 09/10/23.
//

import SwiftUI

struct IndexCircles: View {
    @Binding var indexTutorial: Int
    @State var circleIndex: [Bool] 
    
    var body: some View {
        if circleIndex[indexTutorial] == false {
            Circle()
                .frame(width: 10)
                .padding(.bottom, 15)
					 .foregroundStyle(Color.white)
            
        } else {
            Circle()
                .frame(width: 10)
                .padding(.bottom, 15)
                .foregroundStyle(Color("DarkBlue"))
        }
    }
}
