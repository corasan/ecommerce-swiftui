//
//  HomeScreen.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/23/21.
//

import SwiftUI

struct HomeScreen: View {
	@ObservedObject var storeData: StoreData = StoreData()
	
	var body: some View {
		VStack {
			TopBar().environmentObject(self.storeData)
			TabSelectionView(categories: self.storeData.categories, items: self.storeData.items).environmentObject(self.storeData)
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
