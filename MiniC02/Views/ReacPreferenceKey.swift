//
//  ReacPreferenceKey.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 09/10/23.
//

import SwiftUI

/// This PeferenceKey is used to pass a CGRect value from the child view to the parent view.
struct RectPreferenceKey: PreferenceKey
{
	 typealias Value = CGRect

	 static var defaultValue = CGRect.zero

	 static func reduce(value: inout CGRect, nextValue: () -> CGRect)
	 {
		  value = nextValue()
	 }
}
