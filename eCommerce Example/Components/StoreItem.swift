//
//  ProductItem.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/25/21.
//

import SwiftUI

struct StoreItemType {
	var name: String
	var price: String
	var image: String
	var sizes: [String]
}

struct StoreItem: View {
	var data: StoreItemType
	@State var openItem = false
	
	init(data: StoreItemType) {
		self.data = data
	}
	
	private func setOpenItem() {
		self.openItem.toggle()
	}
	
	var body: some View {
		Button(action: self.setOpenItem) {
			VStack {
				VStack {
					Image(self.data.image).resizable()
				}
				.frame(width: 240, height: 340)
				.cornerRadius(16)
				
				HStack {
					Text(self.data.name)
						.fontWeight(.bold)
						.font(.system(size: 18))
						.foregroundColor(.black)
					Spacer()
					Text(self.data.price)
						.foregroundColor(.gray)
						.fontWeight(.semibold)
				}
				.padding(.top, 6)
				.padding(.horizontal, 4)
			}
			.frame(width: 240)
			.padding(14)
		}
		.sheet(isPresented: $openItem, content: {
//			StoreItemModal(["name": self.name as! String, "price"])
		})
	}
}

struct StoreItem_Previews: PreviewProvider {
	static var data: StoreItemType = StoreItemType(name: "Oversized Coat", price: "$200.00", image: "oversizedCoat", sizes: ["XS", "S", "M", "L", "XL"])
	static var previews: some View {
		StoreItem(data: data)
	}
}
