//
//  TagView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 03/10/23.
//

import SwiftUI

struct TagView: View {
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, World!")
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button {
                        showingSheet.toggle()
                    } label: {
                        Image(systemName: "info.circle.fill")
                            .foregroundStyle(Color("DarkBlue"))
                    }
                    .sheet(isPresented: $showingSheet) {
                        TagInformationView()
                    }
                }
                
                
            }
        }
    }
}


#Preview {
    TagView()
}
