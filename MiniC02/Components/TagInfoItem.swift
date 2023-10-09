//
//  TagInfoItem.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 04/10/23.
//

import SwiftUI

struct TagInfoItem: View {
    
    
    
    var body: some View {
        GeometryReader{ geometry in
            HStack(alignment: .center){
                Image("icon-Closed_Captions")
                    .resizable()
                    .frame(width: geometry.size.width * 0.18, height: geometry.size.height * 0.1)
                    .padding(.leading)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading){
                    Text("São pessoas surdas que optam por se comunicar através da Libras, estabelecem uma convivência entre si e não possuem interesse em aprender a oralizar.")
                        .font(Font.custom("SF Pro", size: 15))
                        .padding(.trailing)
                }
            }
        }
    }
}

#Preview {
    TagInfoItem()
}
