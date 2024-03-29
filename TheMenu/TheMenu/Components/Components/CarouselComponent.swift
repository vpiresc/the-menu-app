import Foundation
import SwiftUI

struct CarouselComponent: UIComponent {
    let uiModel: CarouselUIModel
    let id = UUID()
    let navigator: NavigatorProtocol
    
    func render() -> AnyView {
        CarouselView(uiModel: uiModel, navigator: navigator).toAnyView()
    }
}
