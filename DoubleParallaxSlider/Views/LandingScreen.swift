//
//  LandingScreen.swift
//  DoubleParallaxSlider
//
//  Created by Lakshaya Sachdeva on 18/10/23.
//

import SwiftUI

struct LandingScreen: View {
    @State private var searchText: String = ""
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
                Text("Parallax Effect")
                    .font(.largeTitle.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 10)
                
                HStack(spacing: 12) {
                    HStack(spacing: 12){
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Search", text: $searchText)
                    }
                    .padding(.horizontal, 15)
                    .padding(.vertical, 10)
                    .background(.ultraThinMaterial, in: .capsule)
                }
                
                // Parallax carousel
                GeometryReader(content: { geometry in
                    let size = geometry.size
                    ScrollView(.horizontal) {
                        HStack(spacing: 4) {
                            ForEach(cards) { card in
                                // In order to move card to reverse direction (parallax effect)
                                GeometryReader(content: { proxy in
                                    let cardSize = proxy.size
                                    let minX = min((proxy.frame(in: .scrollView).minX * 1.4), proxy.size.width * 1.4)
                                    Image(card.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        //.scaleEffect(1.25)
                                        .offset(x: -minX)
                                        .frame(width: proxy.size.width * 2.5)
                                        .frame(width: cardSize.width, height: cardSize.height)
                                        .clipShape(.rect(cornerRadius: 15))
                                        .shadow(color: .black.opacity(0.25), radius: 8, x:5, y: 10)
                                })
                                // since we have given padding of 30, which means 60 that's why reducing 60 px
                                .frame(width: size.width - 60, height: size.height - 50)
                                // scroll animation
                                .scrollTransition(.interactive, axis: .horizontal) {
                                    view, phase in
                                    view
                                        .scaleEffect(phase.isIdentity ? 1 : 0.95)
                                }
                            }
                        }
                        .padding(.horizontal, 30)
                        .scrollTargetLayout()   // available only in ios17
                        .frame(height: size.height, alignment: .top)
                    }
                    .scrollTargetBehavior(.viewAligned)   // availalbe in ios17 only
                    .scrollIndicators(.hidden)
                })
                .frame(height: 500)
                .padding(.horizontal, -15)
                .padding(.top, 10)
            }
            .padding(15)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
