//
//  ProductItem.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/25/21.
//

import SwiftUI

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
				.frame(width: 220, height: 320)
				.cornerRadius(16)
				
				HStack {
					VStack(alignment: .leading) {
						Text(self.data.name.capitalized)
							.fontWeight(.bold)
							.font(.system(size: 18))
							.foregroundColor(.black)
						Text(self.data.price)
							.foregroundColor(.gray)
							.fontWeight(.semibold)
							.padding(.vertical, 2)
					}
					Spacer()
				}
				.padding(.top, 5)
				.padding(.horizontal, 12)
			}
			.frame(width: 240)
			.padding(14)
		}
		.sheet(isPresented: $openItem, content: {
			StoreItemModal(data: self.data, onClose: setOpenItem)
		})
	}
}

struct StoreItem_Previews: PreviewProvider {
	static var data: StoreItemType = StoreItemType(name: "Oversized Coat", price: "$200.00", image: "oversizedCoat", sizes: ["XS", "S", "M", "L", "XL"])
	static var previews: some View {
		StoreItem(data: data)
	}
}
