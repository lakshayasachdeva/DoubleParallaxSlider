//
//  ImageCard.swift
//  DoubleParallaxSlider
//
//  Created by Lakshaya Sachdeva on 18/10/23.
//

import Foundation

struct ImageCard: Identifiable {
    let id: UUID = .init()
    let imageName: String
    let title: String
    let subTitle: String
}

var cards: [ImageCard] = [
    ImageCard(imageName: "Image 1", title: "Image-1", subTitle: "First image"),
    ImageCard(imageName: "Image 2", title: "Image-2", subTitle: "Second image"),
    ImageCard(imageName: "Image 3", title: "Image-3", subTitle: "Third image"),
    ImageCard(imageName: "Image 4", title: "Image-4", subTitle: "Fourth image"),
    ImageCard(imageName: "Image 5", title: "Image-5", subTitle: "Fifth image"),
    ImageCard(imageName: "Image 6", title: "Image-6", subTitle: "Sixth image"),
    ImageCard(imageName: "Image 7", title: "Image-7", subTitle: "Seventh image"),
    ImageCard(imageName: "Image 8", title: "Image-8", subTitle: "Eigth image"),
    ImageCard(imageName: "Image 9", title: "Image-9", subTitle: "Ninth image"),
    ImageCard(imageName: "Image 10", title: "Image-10", subTitle: "Tenth image")
]
