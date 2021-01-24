//
//  StoreData.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/24/21.
//

import SwiftUI

class StoreData: ObservableObject {
	@Published var data = [String: Any]()
	@Published var categories = [String]()
	
	func setData() {
		let url = Bundle.main.url(forResource: "data", withExtension: "json")!
		do {
			let jsonData = try Data(contentsOf: url)
			let json = try JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
			let data = json["data"] as! [String: Any]
			self.data = data
			self.categories = data["categories"] as! [String]
		} catch {
			print(error)
		}
	}
}
