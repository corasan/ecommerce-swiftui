//
//  HomeScreen.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/23/21.
//

import SwiftUI

struct HomeScreen: View {
	@State var tabViews: [TabViewerType] = []
	@State var categories: [String] = []
	var storeData: StoreData
	
	init() {
		self.storeData = StoreData()
	}
	
	var body: some View {
		VStack {
			TopBar()
			TabViewer().environmentObject(self.storeData)
			Spacer()
		}
		.onAppear {
			storeData.setData()
		}
	}
}

struct HomeScreen_Previews: PreviewProvider {
	static var storeData = StoreData()

	static var previews: some View {
		HomeScreen()
	}
}
