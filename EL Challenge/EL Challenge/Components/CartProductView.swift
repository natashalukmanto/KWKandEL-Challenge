//
//  CartProductView.swift
//  EL Challenge
//
//  Created by Natasha Lukmanto on 7/14/23.
//

import SwiftUI

struct CartProductView: View {
    @EnvironmentObject var cartManager: CartManager
    var product: Product
    var body: some View {
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .cornerRadius(9)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name)
                    .bold()
                    .font(.custom("Optima", size: 20) .bold())
                    .foregroundColor(.brightPink)
                Text("$ \(product.price)")
                    .bold()
                    .font(.custom("Optima", size: 20) .bold())
                    .foregroundColor(.brightPink)
                    
            }
            .padding()
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.brightPink)
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .background(Color.paleDogwood)
        .cornerRadius(12)
        .frame(width: .infinity, alignment: .leading)
        .padding()
    }
}

struct CartProductView_Previews: PreviewProvider {
    static var previews: some View {
        CartProductView(product: productList[2])
            .environmentObject(CartManager())
    }
}
