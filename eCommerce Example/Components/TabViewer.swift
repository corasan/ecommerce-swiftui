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
	var options: Array<String> = ["Option1", "Option2"]
	var views: Array<TabViewerType>
	@State var selected: Int = 0
	
	init(selected: Int, views: Array<TabViewerType>) {
		self.views = views
		self.selected = selected
	}
	
	func fontColor(_ value: String) -> Color {
		return self.options[self.selected] == value ? Color.black : Color.gray
	}
	
	func selectedBackground(_ value: String) -> Color {
		return self.options[self.selected] == value ? Color("accent") : Color.white
	}
	
	func onClick(_ value: Int) -> Void {
		self.selected = value
	}
	
	var body: some View {
		VStack {
			HStack {
				ForEach(Array(options.enumerated()), id: \.offset) { (index, el) in
					Button(action: { onClick(index) }) {
						Text(el)
							.padding(.horizontal, 20)
							.padding(.vertical, 10)
							.background(selectedBackground(el))
							.cornerRadius(50)
							.foregroundColor(fontColor(el))
							.font(.system(size: 16, weight: .semibold))
							.padding(6)
					}
				}
			}
			VStack {
				views[selected].view
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
	static var arr: [TabViewerType] = []
	static var example1 = TabViewerType(label: "Example1", view: AnyView(ExampleView1()))
	static var example2 = TabViewerType(label: "Example2", view: AnyView(ExampleView2()))
	
	static var previews: some View {
		TabViewer(selected: 0, views: [example1, example2])
	}
}
#endif
