//
//  RoundedButton.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/27/21.
//

import SwiftUI

struct RoundedButton: View {
	var label: String
	var onPress: () -> Void
	
	init(label: String, onPress: @escaping () -> Void) {
		self.label = label
		self.onPress = onPress
	}

    var body: some View {
		Button(action: self.onPress) {
			HStack {
				Text(self.label)
					.foregroundColor(.white)
					.font(.system(size: 18))
					.fontWeight(.semibold)
			}
			.padding(.horizontal, 30)
			.padding(.vertical, 15)
			.background(Color.black)
			.cornerRadius(100)
		}
    }
}

struct RoundedButton_Previews: PreviewProvider {
	static func onPress() {
		print("pressed")
	}
    static var previews: some View {
		RoundedButton(label: "Add to cart", onPress: onPress)
    }
}
