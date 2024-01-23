import Foundation
import SwiftUI

struct ListComponent: UIComponent {
    let id = UUID()
    let uiModel: ListUIModel
    let navigator: NavigatorProtocol
    
    func render() -> AnyView {
        ForEach(uiModel.rows, id: \.id) { row in
            navigator.perform(action: uiModel.action, payload: row) {
                RowComponent(uiModel: row).render().toAnyView()
            }
        }.toAnyView()
    }
}
