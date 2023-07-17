//
//  CartButton.swift
//  EL Challenge
//
//  Created by Natasha Lukmanto on 7/14/23.
//

import SwiftUI

struct CartButton: View {
    var numberOfProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image(systemName: "bag.fill")
                .padding(5)
                .foregroundColor(.oldRose)
            if numberOfProducts > 0 {
                Text("\(numberOfProducts)")
                    .font(.custom("Optima", size: 10))
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(Color.brightPink)
                    .cornerRadius(15)
            }
        }
    }
}

struct CartButton_Previews: PreviewProvider {
    static var previews: some View {
        CartButton(numberOfProducts: 1)
    }
}
