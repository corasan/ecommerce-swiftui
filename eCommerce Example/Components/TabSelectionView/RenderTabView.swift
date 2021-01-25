//
//  RenderTabView.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/25/21.
//

import SwiftUI

struct RenderTabView: View {
	var tabChildren: [String: Array<[String: Any]>]
	var category: String
	
	init(tabChildren: [String: Array<[String: Any]>], category: String) {
		self.tabChildren = tabChildren
		self.category = category
	}

    var body: some View {
		VStack {
			if ((self.tabChildren[self.category]?.isEmpty) != nil) {
				ForEach(Array((self.tabChildren[self.category]?.enumerated())!), id: \.offset) { (index, item) in
					Text(item["name"] as! String)
				}
			}
		}
    }
}

struct RenderTabView_Previews: PreviewProvider {
	static var obj = [
		"coats": [
			[
				"name": "hello",
				"price": "$10.00"
			],
		]
	]

    static var previews: some View {
        RenderTabView(tabChildren: obj, category: "coats")
    }
}
