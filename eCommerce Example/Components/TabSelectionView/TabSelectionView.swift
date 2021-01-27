//
//  TabViewer.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/25/21.
//

import SwiftUI

struct TabSelectionView: View {
	@State var selected: Int = 0
	@State var category: String = "coats"
	var categories: [String]
	var items: [String: [StoreItemType]]
	
	init(categories: [String], items: [String: [StoreItemType]]) {
		self.categories = categories
		self.items = items
	}
	
	func onClick(_ value: Int) -> Void {
		self.selected = value
		self.category = self.categories[value]
	}
	
	var body: some View {
		VStack {
			TabItems(options: self.categories, selected: self.selected, onClick: self.onClick)
			FeaturedList(data: self.items, category: self.category)
			Spacer()
		}
	}
}

// This is only for preview purposes
#if DEBUG
struct TabSelectionView_Previews: PreviewProvider {
	static var options = ["coats", "jeans"]
	static var item1 = StoreItemType(name: "Oversized Coat", price: "$200.00", image: "oversizedCoat", sizes: ["XS", "S", "M", "L", "XL"])
	static var item2 = StoreItemType(name: "Oversized Coat", price: "$200.00", image: "oversizedCoat", sizes: ["XS", "S", "M", "L", "XL"])
	static var obj = [
		"coats": [item1, item2]
	]
	
	static var previews: some View {
		TabSelectionView(categories: options, items: self.obj)
	}
}
#endif
