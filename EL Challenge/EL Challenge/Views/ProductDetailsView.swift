//
//  ProductDetailsView.swift
//  EL Challenge
//
//  Created by Natasha Lukmanto on 7/15/23.
//

import SwiftUI

struct ProductDetailsView: View {
    var product: Product
    var body: some View {
        ScrollView {
            ZStack {
                Color.white
                
                VStack(alignment: .leading) {
                    ZStack(alignment: .topTrailing){
                        Image(product.image)
                            .resizable()
                            .ignoresSafeArea(edges: .top)
                            .frame(height: 300)
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .padding(.top, 63)
                            .padding(.trailing, 20)
                    }
                    VStack(alignment: .leading) {
                        HStack {
                            Text(product.name)
                                .bold()
                                .font(.custom("Optima", size: 25) .bold())
                                .foregroundColor(.brightPink)
                            
                            Spacer()
                            
                            Text("$\(product.price).00")
                                .bold()
                                .font(.custom("Optima", size: 25) .bold())
                                .foregroundColor(.brightPink)
                                .padding(.horizontal)
                                .background(Color.paleDogwood)
                                .cornerRadius(12)
                        }
                        .padding(.vertical)
                        
                        HStack {
                            HStack(spacing: 10){
                                ForEach(0..<5){index in
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                        .foregroundColor(.amaranthPink)
                                }
                                Text("(4.5)")
                                    .foregroundColor(.amaranthPink)
                                    
                            }
                            .padding(.vertical)
                            
                            Spacer()
                            
                            HStack {
                                Button(action: {}, label: {
                                    Image(systemName: "minus.square")
                                })
                                Text("1")
                                Button(action: {}, label: {
                                    Image(systemName: "plus.square.fill")
                                })
                            }
                        }
                        Text("Description")
                            .bold()
                            .font(.custom("Optima", size: 15) .bold())
                            .foregroundColor(.brightPink)
                        Text(product.description)
                            .bold()
                            .font(.custom("Optima", size: 15) .bold())
                            .foregroundColor(.brightPink)
                        
                        HStack(alignment: .top) {
                            VStack (alignment: .leading){
                                Text("Size: 10 oz./30ml")
                                .font(.custom("Optima", size: 18))
                                .foregroundColor(.brightPink)
                                .fontWeight(.semibold)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Made with")
                                    .font(.custom("Optima", size: 18))
                                    .foregroundColor(.brightPink)
                                    .fontWeight(.semibold)
                                Text("- coconut water")
                                    .font(.custom("Optima", size: 18))
                                    .foregroundColor(.brightPink)
                                Text("- red algae")
                                    .font(.custom("Optima", size: 18))
                                    .foregroundColor(.brightPink)
                                Text("- sweet kelp")
                                    .font(.custom("Optima", size: 18))
                                    .foregroundColor(.brightPink)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                        }
                        .padding(.vertical)
                        
                        PaymentButton(action: {})
                            .frame(width: .infinity, height: 35)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(20)
                    .offset(y: -30)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView(product: productList[1])
    }
}

struct ColorDotView: View {
    let color: Color
    var body: some View{
        color
            .frame(width: 25, height: 25)
            .clipShape(Circle())
    }
}
