//
//  TopBar.swift
//  eCommerce Example
//
//  Created by Henry Paulino on 1/21/21.
//

import SwiftUI

struct TopBar: View {
    @State private var selected = 0
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 42, height: 42)
                Spacer()
                Text(.init(systemName: "cart.fill"))
                    .font(.title)
            }
            .padding(.horizontal, 24)
        }
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TopBar()
        }
    }
}
