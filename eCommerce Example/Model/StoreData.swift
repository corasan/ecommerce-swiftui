//
//  StoreData.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/24/21.
//

import SwiftUI
import SwiftyJSON

struct StoreItemType {
	var name: String
	var price: String
	var image: String
	var sizes: [String]
	var description: String?
	var category: String?
}

class StoreData: ObservableObject {
	@Published var data = [String: Any]()
	@Published var categories = [String]()
	@Published var items = [String: [StoreItemType]]()
	@Published var cart = [StoreItemType]()
	@Published var cartCount = "0"
	
	func addToStore(newItem: StoreItemType) {
		self.cart.append(newItem)
		self.cartCount = String(self.cart.count)
	}
	
	func setData() {
		let url = Bundle.main.url(forResource: "data", withExtension: "json")!
		do {
			let data = try Data(contentsOf: url)
			let json = JSON(data)
			self.categories = json["categories"].arrayValue.map {$0.stringValue}
			var obj = [String: [StoreItemType]]()
			for (key, subJson) in json["data"]["items"] {
				var arr = [StoreItemType]()
				for (_, el) in subJson {
					arr.append(StoreItemType(name: el["name"].stringValue, price: el["price"].stringValue, image: el["image"].stringValue, sizes: el["sizes"].arrayValue.map {$0.stringValue}))
					obj[key] = arr
				}
			}
			self.items = obj
		} catch {
			print(error)
		}
	}
}
