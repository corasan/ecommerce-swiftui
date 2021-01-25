//
//  ProductItem.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/25/21.
//

import SwiftUI

struct ProductItem: View {
	var name: String
	var price: String
	var image: String
	
	init(name: String, price: String, image: String) {
		self.name = name
		self.price = price
		self.image = image
	}
	
	var body: some View {
		VStack {
			VStack {
				Image(self.image).resizable()
			}
			.frame(width: 240, height: 340)
			.cornerRadius(16)
			
			HStack {
				Text(self.name)
					.fontWeight(.bold)
					.font(.system(size: 18))
				Spacer()
				Text(self.price)
					.foregroundColor(.gray)
					.fontWeight(.semibold)
			}
			.padding(.top, 6)
			.padding(.horizontal, 4)
		}
		.frame(width: 240)
		.padding(14)
	}
}

struct ProductItem_Previews: PreviewProvider {
	static var previews: some View {
		ProductItem(name: "Oversized Coat", price: "$219.00", image: "oversizedCoat")
	}
}
