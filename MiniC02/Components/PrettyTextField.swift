//
//  PrettyTextField.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 19/10/23.
//

import SwiftUI

struct PrettyTextField: View {
	
	var localizedString: String
	@Binding var text: String
	
    var body: some View {
		 ZStack {
			 Color("PrettyTextFieldColor")
			 TextField(localizedString, text: $text)
				 .padding()
		 }
		 .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

