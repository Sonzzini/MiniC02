//
//  DisclosureGroupStyle.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 05/10/23.
//

import SwiftUI



struct DisclosureGroupImageStyle: DisclosureGroupStyle {
    @State var icon: String
    func makeBody(configuration: Configuration) -> some View {
            VStack {
                Button {
                    withAnimation {
                        configuration.isExpanded.toggle()
                    }
                } label: {
                    Image("icon-\($icon)")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                }
                .buttonStyle(.plain)
                if configuration.isExpanded {
                    configuration.content
                }
            }
        }}

//#Preview {
//    DisclosureGroupImageStyle()
//}
