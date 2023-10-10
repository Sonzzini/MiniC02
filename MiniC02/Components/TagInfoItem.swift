//
//  TagInfoItem.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 04/10/23.
//

import SwiftUI

struct TagInfoItem: View {
    var body: some View {
        
        VStack {
            HStack(alignment: .center){
                Image(.iconInterpreteLibras)
                    .resizable()
                    .frame(width:43, height: 43)
                    .padding(.leading)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading){
                    Text("O local oferece ajuda e/ou acesso para surdos.")
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
