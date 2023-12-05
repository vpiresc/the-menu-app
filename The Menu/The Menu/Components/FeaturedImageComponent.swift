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
    let id = UUID()
    
    func render() -> AnyView {
        return AsyncImage(url: uiModel.imageUrl) { image in
            image.resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            ProgressView()
        }.toAnyView()
    }
}
