//
//  SheetView.swift
//  MiniC02
//
//  Created by Gabriel Fonseca on 11/10/23.
//

import SwiftUI

struct ProfileSheetView: View {
    @State var teste = true
    var body: some View {
        
        List {
            HStack{
                Image(systemName: "pencil")
                Text("Editar Perfil")
                    
            }
            .font(.system(size: 23))
            
            HStack{
                Image(systemName: "ladybug.fill")
                Link("Reportar um Problema", destination: URL(string: "https://airtable.com/appD46zZB7myjSdlK/shr8fthpV44OWR5GW")!)
            }
            .font(.system(size: 23))
            .foregroundColor(Color.black)
            
        }
        Text("Sair")
            .foregroundStyle(Color.red)
    }
}

#Preview {
    ProfileSheetView()
}
