//
//  TabViewer.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/25/21.
//

import SwiftUI

class TabViewerType {
	var label: String
	var view: AnyView
	init(label: String, view: AnyView) {
		self.label = label
		self.view = view
	}
}

struct TabSelectionView: View {
	@State var selected: Int = 0
	@State var category: String = "coats"
	var categories: [String]
	var items: [String: Array<[String: Any]>]
	
	init(categories: [String], items: [String: Array<[String: Any]>]) {
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
			RenderTabView(tabChildren: self.items, category: self.category)
			Spacer()
		}
	}
}

// This is only for preview purposes
#if DEBUG
struct ExampleView1: View {
	var body: some View {
		Text("Example view 1")
	}
}
struct ExampleView2: View {
	var body: some View {
		Text("Example view 2")
	}
}

struct TabSelectionView_Previews: PreviewProvider {
	static var options = ["coats", "jeans"]
	static var obj = [
		"coats": [
			[
				"name": "hello",
				"price": "$10.00"
			],
		]
	]
	
	static var previews: some View {
		TabSelectionView(categories: options, items: self.obj)
	}
}
#endif
