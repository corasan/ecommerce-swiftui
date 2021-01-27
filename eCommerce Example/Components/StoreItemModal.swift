//
//  StoreItemModal.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/26/21.
//

import SwiftUI

struct StoreItemModal: View {
	var data: StoreItemType
	var onClose: () -> Void
	@State var selectedSize = ""
	
	init(data: StoreItemType, onClose: @escaping () -> Void) {
		self.data = data
		self.onClose = onClose
	}
	
	func onSizePress(_ value: String) -> Void {
		self.selectedSize = value
	}
	
    var body: some View {
		VStack {
			HStack {
				Button(action: self.onClose) {
					Text(.init(systemName: "xmark"))
						.foregroundColor(.black)
				}
				.frame(width: 40, height: 40)
				.background(Color.gray)
				.cornerRadius(20)
				.opacity(0.4)
				Spacer()
			}
			.padding(10)
			Spacer()
			ItemDetails(name: self.data.name, price: self.data.price, sizes: self.data.sizes)
		}
		.background(VStack {
			Image(self.data.image)
				.resizable()
				.aspectRatio(contentMode: .fit)
			Spacer()
		})
    }
}

struct StoreItemModal_Previews: PreviewProvider {
	static var data: StoreItemType = StoreItemType(name: "Oversized Coat", price: "$200.00", image: "oversizedCoat", sizes: ["XS", "S", "M", "L", "XL"])
	static func onClose() {
		print("pressed")
	}
    static var previews: some View {
		StoreItemModal(data: data, onClose: onClose)
    }
}

struct ItemDetails: View {
	var name: String
	var price: String
	var sizes: [String]
	@State var selectedSize = ""
	
	init(name: String, price: String, sizes: [String]) {
		self.name = name
		self.price = price
		self.sizes = sizes
	}
	
	func addToCart() {
		print("pressed")
	}
	
	func onSizePress(_ value: String) -> Void {
		self.selectedSize = value
	}
	
	var body: some View {
		VStack {
			HStack {
				HStack {
					Text(self.name)
						.font(.title)
						.fontWeight(.bold)
					Spacer()
				}
				.padding(.horizontal, 20)
			}
			
			HStack {
				VStack(alignment: .leading) {
					Text(self.price)
						.font(.title2)
						.fontWeight(.semibold)
						.padding(.vertical, 5)
						.foregroundColor(.gray)
					Text("Your Sizes")
						.foregroundColor(.gray)
						.fontWeight(.medium)
						.font(.title3)
					
					HStack {
						ForEach(self.sizes, id: \.self) { el in
							Button(action: {
								self.onSizePress(el)
							}, label: {
								Group {
									Text(el)
										.foregroundColor(.black)
										.fontWeight(.semibold)
										.opacity(0.7)
								}
								.frame(minWidth: 34, minHeight: 34)
								.background(Color.white)
								.cornerRadius(4, antialiased: true)
								.shadow(color: Color.gray.opacity(0.4), radius: 1, x: -0.5, y: 0.5)
							})
						}
					}
					.padding(.vertical, 2)
				}
				Spacer()
			}
			.padding(.horizontal, 20)
			.padding(.bottom, 30)
			
			RoundedButton(label: "Add to cart", onPress: self.addToCart)
		}
		.padding(.top, 20)
		.background(Color.white)
		.cornerRadius(15)
	}
}
