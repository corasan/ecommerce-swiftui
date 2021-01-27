//
//  TopBar.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/21/21.
//

import SwiftUI

struct TopBar: View {
	@EnvironmentObject var storeData: StoreData
	@State var openCart = false
	
	func openCartScreen() {
		self.openCart.toggle()
	}

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 42, height: 42)
                Spacer()
				Button(action: openCartScreen) {
					HStack {
						Text(.init(systemName: "cart.fill"))
							.font(.title)
							.foregroundColor(.black)
						HStack {
							Text(storeData.cartCount)
								.font(.system(size: 13))
								.foregroundColor(.black)
						}
						.padding(.horizontal, 8)
						.padding(.vertical, 4)
						.background(Color("accent"))
						.cornerRadius(25)
						.padding(.leading, -20)
						.padding(.bottom, 25)
					}
				}
				.sheet(isPresented: $openCart, content: {
					CartScreen()
				})
            }
            .padding(.horizontal, 24)
        }
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
			TopBar().environmentObject(StoreData())
        }
    }
}
