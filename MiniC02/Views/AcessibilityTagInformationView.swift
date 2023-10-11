//
//  TagInformationView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 03/10/23.
//
//


import SwiftUI

struct AcessibilityTagInformationView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 25) {
                    ForEach(AccessibilityTag.allCases, id: \.self) { tag in
                        TagInfoItem(tag: tag)
                            .padding(.horizontal, 15)
                    }
                    
                   
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Acessibilidade")
                    }
                    ToolbarItem {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Ok")
                        })
                    }
                }
            }
        }
    }
}

#Preview {
    AcessibilityTagInformationView()
}
