//
//  DeleteButtonStyle.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 19/10/23.
//

import SwiftUI

struct DeleteButtonStyle: ButtonStyle {
	 func makeBody(configuration: Configuration) -> some View {
		 configuration.label
			  .foregroundStyle(.red)

	}
}
