//
//  TabItems.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/25/21.
//

import SwiftUI

struct TabItems: View {
	var options: [String]
	var selected: Int
	var onClick: (_ value: Int) -> Void
	
	init(options: [String], selected: Int, onClick: @escaping (_ value: Int) -> Void) {
		self.options = options
		self.selected = selected
		self.onClick = onClick
	}
	
	func selectedBackground(_ value: String) -> Color {
		let categories = self.options
		return categories[self.selected] == value ? Color("accent") : Color.white
	}
	
	func fontColor(_ value: String) -> Color {
		let categories = self.options
		return categories[self.selected] == value ? Color.black : Color.gray
	}

    var body: some View {
		ScrollView(.horizontal, showsIndicators: false) {
			HStack {
				Spacer()
				ForEach(Array(self.options.enumerated()), id: \.offset) { (index, el) in
					Button(action: { self.onClick(index) }) {
						Text(el.capitalized)
							.padding(.horizontal, 20)
							.padding(.vertical, 10)
							.background(self.selectedBackground(el))
							.cornerRadius(50)
							.foregroundColor(self.fontColor(el))
							.font(.system(size: 16, weight: .semibold))
							.padding(5)
					}
				}
				Spacer()
			}
		}
    }
}

struct TabItems_Previews: PreviewProvider {
	@State static var selected = 0
	
	static func onClick(_ value: Int) -> Void {
		self.selected = value
	}

    static var previews: some View {
		TabItems(options: ["coats", "pants"], selected: self.selected, onClick: self.onClick)
    }
}
