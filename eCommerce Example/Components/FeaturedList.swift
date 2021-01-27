//
//  FeaturedList.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/26/21.
//

import SwiftUI

struct FeaturedList: View {
	var data: [String: Array<[String: Any]>]
	var category: String
	
	init(data: [String: Array<[String: Any]>], category: String) {
		self.data = data
		self.category = category
	}
	
	var body: some View {
		VStack {
			HStack {
				Text("Featured")
					.font(.title)
					.fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
				Spacer()
			}
			.padding(.horizontal, 20)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					if ((self.data[self.category]?.isEmpty) != nil) {
						ForEach(Array((self.data[self.category]?.enumerated())!), id: \.offset) { (index, item) in
							StoreItem(name: item["name"] as! String, price: item["price"] as! String, image: item["image"] as! String)
						}
					}
				}
			}
		}
	}
}

struct FeaturedList_Previews: PreviewProvider {
	static var obj = [
		"coats": [
			[
				"name": "hello",
				"price": "$10.00",
				"image": "oversizedCoat"
			],
			[
				"name": "hello",
				"price": "$10.00",
				"image": "oversizedCoat"
			],
		]
	]
	static var previews: some View {
		FeaturedList(data: obj, category: "coats")
	}
}
