//
//  TabViewer.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/22/21.
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

struct TabViewer: View {
	@State var selected: Int = 0
	@State var category: String = "coats"
	var categories: [String]
	var items: [String: Array<[String: Any]>]
	
	init(categories: [String], items: [String: Array<[String: Any]>]) {
		self.categories = categories
		self.items = items
	}
	
	func fontColor(_ value: String) -> Color {
		let categories = self.categories
		return categories[self.selected] == value ? Color.black : Color.gray
	}
	
	func selectedBackground(_ value: String) -> Color {
		let categories = self.categories
		return categories[self.selected] == value ? Color("accent") : Color.white
	}
	
	func onClick(_ value: Int) -> Void {
		self.selected = value
		self.category = self.categories[value]
	}
	
	var body: some View {
		VStack {
			ScrollView(.horizontal, showsIndicators: false) {
				HStack {
					Spacer()
					ForEach(Array(self.categories.enumerated()), id: \.offset) { (index, el) in
						Button(action: { onClick(index) }) {
							Text(el.capitalized)
								.padding(.horizontal, 20)
								.padding(.vertical, 10)
								.background(selectedBackground(el))
								.cornerRadius(50)
								.foregroundColor(fontColor(el))
								.font(.system(size: 16, weight: .semibold))
								.padding(6)
						}
					}
					Spacer()
				}
			}
			VStack {
				if ((self.items[self.category]?.isEmpty) != nil) {
					ForEach(Array((self.items[self.category]?.enumerated())!), id: \.offset) { (index, item) in
						Text(item["name"] as! String)
					}
				}
				
			}
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

struct TabViewer_Previews: PreviewProvider {
	static var options = ["Option1", "Option2"]
	static var arr: [TabViewerType] = []
	static var example1 = TabViewerType(label: "Example1", view: AnyView(ExampleView1()))
	static var example2 = TabViewerType(label: "Example2", view: AnyView(ExampleView2()))
	static var obj = [
		"coats": [
			[
				"name": "hello",
				"price": "$10.00"
			],
		]
	]
	
	static var previews: some View {
		TabViewer(categories: options, items: self.obj)
	}
}
#endif
