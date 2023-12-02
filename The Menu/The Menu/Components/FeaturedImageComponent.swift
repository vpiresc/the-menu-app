//
//  FeaturedImageComponent.swift
//  The Menu
//
//  Created by Vitor Pires on 01/12/23.
//

import Foundation
import SwiftUI

struct FeaturedImageComponent: UIComponent {
    
    let uiModel: FeaturedImageUIModel
    
    var uniqueId: String {
        return ComponentType.featuredImage.rawValue
    }
    
    func render() -> AnyView {
//        let imageUrl = URL(string: uiModel.imageUrl)
        return AsyncImage(url: uiModel.imageUrl) { image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }.toAnyView()
    }
}
