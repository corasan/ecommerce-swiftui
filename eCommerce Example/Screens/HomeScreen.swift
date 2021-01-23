//
//  HomeScreen.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/23/21.
//

import SwiftUI

struct HomeScreen: View {
	@State var tabViews: [TabViewerType] = []
	
	init() {
		
	}

	var body: some View {
		VStack {
			TopBar()
//			TabViewer()
		}
	}
}

struct HomeScreen_Previews: PreviewProvider {
	static var previews: some View {
		HomeScreen()
	}
}
