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
	@Published var cart = [String]()
	
	func setData() {
		let url = Bundle.main.url(forResource: "data", withExtension: "json")!
		do {
			let data = try Data(contentsOf: url)
			let json = JSON(data)
			self.categories = json["categories"].arrayValue.map {$0.stringValue}
			var obj = [String: [StoreItemType]]()
			var arr = [StoreItemType]()
			for (key, subJson) in json["data"]["items"] {
				for (_, el) in subJson {
					print(el)
					let newElement = StoreItemType(name: el["name"].stringValue, price: el["price"].stringValue, image: el["image"].stringValue, sizes: el["name"].arrayValue.map {$0.stringValue})
					arr.append(newElement)
					obj[key] = arr
				}
			}
			self.items = obj
		} catch {
			print(error)
		}
	}
}
