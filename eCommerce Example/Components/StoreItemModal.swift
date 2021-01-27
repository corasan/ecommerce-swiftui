//
//  StoreItemModal.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/26/21.
//

import SwiftUI

struct StoreItemModal: View {
	var data: StoreItemType
	@State var selectedSize = ""
	
	init(data: StoreItemType) {
		self.data = data
	}
	
	func onSizePress(_ value: String) -> Void {
		self.selectedSize = value
	}

    var body: some View {
		VStack {
			VStack {
				Image(self.data.image)
					.resizable()
			}
			VStack {
				HStack {
					HStack {
						Text(self.data.name)
							.font(.title)
							.fontWeight(.bold)
						Spacer()
					}
					.padding(.horizontal, 20)
				}
				
				HStack {
					VStack(alignment: .leading) {
						Text(self.data.price)
							.font(.title2)
							.fontWeight(.semibold)
							.padding(.vertical, 5)
							.foregroundColor(.gray)
						Text("Your Size")
							.foregroundColor(.gray)
							.fontWeight(.medium)
							.font(.title3)
						
						HStack {
							ForEach(self.data.sizes, id: \.self) { el in
								Button(action: {
									self.onSizePress(el)
								}, label: {
									Group {
										Text(el)
											.foregroundColor(.black)
											.fontWeight(.semibold)
											.opacity(0.6)
									}
									.frame(minWidth: 34, minHeight: 34)
									.background(Color.white)
									.cornerRadius(4, antialiased: true)
									.shadow(radius: 1, x: -0.5, y: 0.5)
								})
							}
						}
						.padding(.vertical, 2)
					}
					Spacer()
				}
				.padding(.horizontal, 20)
			}
		}
    }
}

struct StoreItemModal_Previews: PreviewProvider {
	static var data: StoreItemType = StoreItemType(name: "Oversized Coat", price: "$200.00", image: "oversizedCoat", sizes: ["XS", "S", "M", "L", "XL"])
    static var previews: some View {
		StoreItemModal(data: data)
    }
}
