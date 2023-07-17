//
//  ProductCardView.swift
//  EL Challenge
//
//  Created by Natasha Lukmanto on 7/14/23.
//

import SwiftUI

struct ProductCardView: View {
    @EnvironmentObject var cartManager : CartManager
    var product: Product
    var body: some View {
        ZStack{
            Color.paleDogwood
            
            ZStack(alignment: .bottomTrailing) {
                VStack(alignment: .leading) {
                    Image(product.image)
                        .resizable()
                        .frame(width: 180, height: 150)
                        .cornerRadius(12)
                    Text(product.name)
                        .font(.custom(
                            "Optima",
                            size: 20) .bold())
                        .padding(.vertical, 1)
                        .foregroundColor(.brightPink)
                    Text("$ \(product.price)")
                        .bold()
                        .font(.custom(
                            "Optima",
                            size: 20))
                        .foregroundColor(.brightPink)
                    
                }
                .padding()
                Button{
                    cartManager.addToCart(product: product)
                } label:{
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .foregroundColor(Color.brightPink)
                        .frame(width: 35, height: 35)
                        .padding()
                }
                
            }
        }
        .frame(width: 200, height: 250)
        .cornerRadius(15)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(product: productList[0])
            .environmentObject(CartManager())
    }
}
