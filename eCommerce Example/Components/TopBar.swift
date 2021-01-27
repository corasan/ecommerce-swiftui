//
//  TopBar.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/21/21.
//

import SwiftUI

struct TopBar: View {
	@EnvironmentObject var storeData: StoreData

    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 42, height: 42)
                Spacer()
				HStack {
					Text(.init(systemName: "cart.fill"))
						.font(.title)
					HStack {
						Text(storeData.cartCount)
							.font(.system(size: 13))
					}
					.padding(.horizontal, 8)
					.padding(.vertical, 4)
					.background(Color("accent"))
					.cornerRadius(25)
					.padding(.leading, -20)
					.padding(.bottom, 25)
				}
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
