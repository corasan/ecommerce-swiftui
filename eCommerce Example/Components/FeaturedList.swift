//
//  FeaturedList.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/26/21.
//

import SwiftUI

struct FeaturedList: View {
	var data: [String: [StoreItemType]]
	var category: String
	
	init(data: [String: [StoreItemType]], category: String) {
		self.data = data
		self.category = category
	}
	
	var body: some View {
		VStack {
			HStack {
				Text("Featured")
					.font(.title)
					.fontWeight(.bold)
					.foregroundColor(.black)
				Spacer()
			}
			.padding(.horizontal, 20)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					if ((self.data[self.category]?.isEmpty) != nil) {
						ForEach(Array((self.data[self.category]?.enumerated())!), id: \.offset) { (index, item) in
							StoreItem(data: item)
						}
					}
				}
			}
		}
	}
}

struct FeaturedList_Previews: PreviewProvider {
	static var item1 = StoreItemType(name: "Oversized Coat", price: "$200.00", image: "oversizedCoat", sizes: ["XS", "S", "M", "L", "XL"])
	static var item2 = StoreItemType(name: "Oversized Coat", price: "$200.00", image: "oversizedCoat", sizes: ["XS", "S", "M", "L", "XL"])
	static var obj = [
		"coats": [item1, item2]
	]
	static var previews: some View {
		FeaturedList(data: obj, category: "coats")
	}
}
