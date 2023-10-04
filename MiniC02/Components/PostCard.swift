//
//  PostCard.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 19/09/23.
//

import SwiftUI

struct PostCard: View {
	
	let user: User
	
	var body: some View {
		
		VStack {
			HStack {
				Image(user.Image)
					.resizable()
					.aspectRatio(contentMode: .fill)
					.frame(width: 30, height: 30)
					.clipShape(Circle())
				
				Text(user.name)
					.font(.body)
			}
		}
	}
}

struct PostCard_Previews: PreviewProvider {
	static var previews: some View {
		PostCard(user: User(name: "Dondetos", username: "paulosonzzini", Image: "PauloProfilePic", tags: [Tag(identifier: "1"), Tag(identifier: "2")]))
	}
}
