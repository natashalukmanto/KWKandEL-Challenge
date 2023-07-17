//
//  SearchView.swift
//  EL Challenge
//
//  Created by Natasha Lukmanto on 7/14/23.
//

import SwiftUI

struct SearchView: View {
    @State private var search: String = ""
    var body: some View {
        HStack {
            HStack{
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                TextField("Search for our products...", text: $search)
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.amaranthPink)
            .cornerRadius(12)
            
            Image(systemName: "camera")
                .padding()
                .foregroundColor(.white)
                .background(Color.amaranthPink)
                .cornerRadius(12)
            
        }.padding(.horizontal)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
