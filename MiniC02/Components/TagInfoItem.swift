//
//  TagInfoItem.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 04/10/23.
//

import SwiftUI

struct TagInfoItem: View {
    var body: some View {
        HStack{
            Image("WelcomeMan")
            VStack(alignment: .leading){
                Text("Politicas")
                    .bold()
                    .font(.title)
                Text("São pessoas surdas que optam por se comunicar através da Libras, estabelecem uma convivência entre si e não possuem interesse em aprender a oralizar.")
            }
        }
    }
}

#Preview {
    TagInfoItem()
}
