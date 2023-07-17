//
//  ImageSliderView.swift
//  EL Challenge
//
//  Created by Natasha Lukmanto on 7/14/23.
//

import SwiftUI

struct ImageSliderView: View {
    @State private var currentIndex = 0
    var slides: [String] = ["estee 63", "estee 14", "estee 20", "estee 44", "estee 1"]
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ZStack(alignment: .trailing) {
                Image(slides[currentIndex])
                    .resizable()
                    .frame(width: .infinity, height: .infinity)
                    .scaledToFit()
                    .cornerRadius(15)
            }
            HStack {
                ForEach(0..<slides.count) {index in
                    Circle()
                        .fill(self.currentIndex == index ? Color.brightPink : Color.white)
                        .frame(width: 10, height: 10)
                }
            }.padding()
        }.padding()
        onAppear{
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true){timer in
                if self.currentIndex + 1 == self.slides.count{
                    self.currentIndex = 0
                } else {
                    self.currentIndex += 1
                }
            }
        }
    }
}

struct ImageSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSliderView()
    }
}
