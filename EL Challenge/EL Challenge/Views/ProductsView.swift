//
//  ProductsView.swift
//  EL Challenge
//
//  Created by Natasha Lukmanto on 7/15/23.
//

import SwiftUI

struct ProductsView: View {
    @EnvironmentObject var cartManager: CartManager
    
    var column = [GridItem(.adaptive(minimum: 200), spacing: 20)]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: column, spacing: 20) {
                    ForEach(productList, id: \.id){product in
                        ProductCardView(product: product)
                        
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Nutritious Products")
            )
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView()
            .environmentObject(CartManager())
    }
}
