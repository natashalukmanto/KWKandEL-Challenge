//
//  HomePageView.swift
//  EL Challenge
//
//  Created by Natasha Lukmanto on 7/14/23.
//

import SwiftUI

struct HomePageView: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top){
                Color.white
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    AppBar()
                    SearchView()
                    Image("estee 15")
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 360, height: 190)
                        .padding()
                        .scaledToFit()
                    HStack {
                        Text("New Arrivals")
                            .font(.custom("Optima", size: 25) .bold())
                            .foregroundColor(.brightPink)
                        Spacer()
                        
                        NavigationLink(destination: {
                            ProductsView()
                        }, label: {
                            Image(systemName: "circle.grid.2x2.fill")
                                .foregroundColor(.brightPink)
                        })
                    }
                    .padding()
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack(spacing: 10){
                            ForEach(productList, id:  \.id){product in
                                NavigationLink{
                                    ProductDetailsView(product: product)
                                } label: {
                                    ProductCardView(product: product)
                                        .environmentObject(cartManager)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
        .environmentObject(cartManager)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
            .environmentObject(CartManager())
    }
}

struct AppBar: View {
    @EnvironmentObject var cartManager: CartManager
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "tag.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.oldRose)
                    Text("CODE: EL123 for 10% off!")
                        .font(.custom("Optima", size: 20) .bold())
                        .foregroundColor(.oldRose)
                    Spacer()
                    NavigationLink(destination: CartView()
                        .environmentObject(cartManager)
                    ){
                        CartButton(numberOfProducts: cartManager.products.count)
                    }
                }
                Text("NUTRITIOUS")
                    .font(.custom("Optima", size: 28) .bold())
                    .foregroundColor(.brightPink)
                + Text(" by Estee Lauder")
                    .font(.custom("Optima", size: 22) .bold())
                    .foregroundColor(.oldRose)
            }
        }
        .padding()
        .environmentObject(CartManager())
    }
}
