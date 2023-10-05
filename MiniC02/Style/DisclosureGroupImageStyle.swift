//
//  DisclosureGroupStyle.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 05/10/23.
//

import SwiftUI

struct DisclosureGroupImageStyle: DisclosureGroupStyle {
    func makeBody(configuration: Configuration) -> some View {
            VStack {
                Button {
                    withAnimation {
                        configuration.isExpanded.toggle()
                    }
                } label: {
                    HStack(alignment: .firstTextBaseline) {
                        configuration.label
                        Spacer()
                        Text(configuration.isExpanded ? "hide" : "show")
                            .foregroundColor(.accentColor)
                            .font(.caption.lowercaseSmallCaps())
                            .animation(nil, value: configuration.isExpanded)
                    }
                    .contentShape(Rectangle())
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
