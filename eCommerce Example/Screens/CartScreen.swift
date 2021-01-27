//
//  CartScreen.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/27/21.
//

import SwiftUI

struct CartScreen: View {
	@EnvironmentObject var storeData: StoreData

    var body: some View {
		VStack {
			HStack {
				Text("Cart")
					.font(.system(size: 48))
					.fontWeight(.bold)
				Spacer()
			}
			ScrollView {
				if (storeData.cart.count > 0) {
					ForEach(Array(storeData.cart.enumerated()), id:\.offset) { (_, el) in
						VStack {
							HStack {
								Image(el.image)
									.resizable()
									.frame(width: 35, height: 55)
									.cornerRadius(2)
								Text(el.name)
									.font(.system(size: 16))
									.fontWeight(.medium)
								Spacer()
								Text(el.price)
									.foregroundColor(.gray)
									.fontWeight(.medium)
							}
							.padding(.vertical, 15)
						}
					}
				} else {
					VStack {
						Text("Cart is empty")
							.font(.system(size: 30))
							.foregroundColor(.gray)
							.opacity(0.7)
					}
					.padding(.vertical, 50)
				}
				
				VStack {
					Divider()
					HStack {
						Spacer()
						Text("Total:")
							.font(.title)
							.fontWeight(.semibold)
						Text("$\(storeData.getTotal())")
							.font(.title)
							.fontWeight(.bold)
					}
				}
				
			}
			Spacer()
		}
		.padding(.horizontal, 20)
		.padding(.top, 15)
    }
}

struct CartScreen_Previews: PreviewProvider {
	static var storeData = StoreData()
	static var obj1 = StoreItemType(name: "Item1", price: "$200.00", image: "oversizedCoat", sizes: ["S"])
    static var previews: some View {
		CartScreen().environmentObject(storeData)
			.onAppear {
				storeData.setData()
				storeData.addToStore(newItem: obj1)
			}
    }
}
