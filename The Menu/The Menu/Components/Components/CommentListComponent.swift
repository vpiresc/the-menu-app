import Foundation
import SwiftUI

struct CommentListComponent: UIComponent {
    let id = UUID()
    let uiModel: CommentListUIModel
    
    func render() -> AnyView {
        ForEach(uiModel.comments, id: \.id) { comment in
            CommentComponent(uiModel: comment).render().toAnyView()
        }.toAnyView()
    }
}
