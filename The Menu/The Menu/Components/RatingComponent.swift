import Foundation
import SwiftUI

struct RatingComponent: UIComponent {
    let id = UUID()
    let uiModel: RatingUIModel
    
    func render() -> AnyView {
        RatingView(rating: .constant(uiModel.rating)).toAnyView()
    }
}
