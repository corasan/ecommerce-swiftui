//
//  HomeScreen.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/23/21.
//

import SwiftUI

struct HomeScreen: View {
	@State var categories: [String] = []
	@ObservedObject var storeData: StoreData = StoreData()
	
	var body: some View {
		VStack {
			TopBar()
			TabSelectionView(categories: self.storeData.categories, items: self.storeData.items)
			Spacer()
		}
		.onAppear {
			self.storeData.setData()
		}
	}
}

struct HomeScreen_Previews: PreviewProvider {
	static var storeData = StoreData()

	static var previews: some View {
		HomeScreen()
	}
}
