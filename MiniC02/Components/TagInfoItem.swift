//
//  TagInfoItem.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 04/10/23.
//

import SwiftUI

struct TagInfoItem: View {
    var tag: AccessibilityTag
    
    var body: some View {
        VStack {
            HStack(alignment: .center){
                Image(tag.rawValue)
                    .resizable()
						  .scaledToFit()
                    .frame(width:43, height: 43)
                    .padding(.leading)
                    .padding(.trailing, 10)
                
                VStack(alignment: .leading){
                    Text(tag.desc)
                        .font(Font.custom("SF Pro", size: 15))
                        .padding(.trailing)
                }
            }
        }
    }
}
