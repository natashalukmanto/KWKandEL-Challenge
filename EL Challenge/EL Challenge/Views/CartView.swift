//
//  CartView.swift
//  EL Challenge
//
//  Created by Natasha Lukmanto on 7/15/23.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        ScrollView{
            
            if cartManager.products.count > 0 {
                ForEach(cartManager.products, id: \.id) {product in
                    CartProductView(product: product)
                }
                HStack {
                    Text("Your Total is ")
                        .font(.custom("Optima", size: 25) .bold())
                        .foregroundColor(.brightPink)
                    Spacer()
                    Text("$ \(cartManager.total).00")
                        .font(.custom("Optima", size: 25) .bold())
                        .foregroundColor(.brightPink)
                }
                .padding()
                PaymentButton(action: {})
                    .padding()
                    .foregroundColor(.brightPink)
            } else {
                Text("Your cart is empty.\n    Time to shop!")
                    .font(.custom("Optima", size: 25) .bold())
                    .foregroundColor(.brightPink)
            }
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
            .environmentObject(CartManager())
    }
}
