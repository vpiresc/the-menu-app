import Foundation
import SwiftUI

protocol NavigatorProtocol {
    func perform<V: View>(action: Action, payload: Any?, content: @escaping () -> V) -> AnyView
}

class Navigator: NavigatorProtocol {
    @MainActor func perform<V: View>(action: Action, payload: Any? = nil, content: @escaping () -> V) -> AnyView {
        var destinationView: AnyView
        
        switch action.destination {
        case .menuItemDetail:
            if let payload = payload as? CarouselItemUIModel {
                destinationView = MenuItemDetailViewFactory.make(itemId: payload.itemId).toAnyView()
            } else if let payload = payload as? RowUIModel {
                destinationView = MenuItemDetailViewFactory.make(itemId: payload.id)
                    .navigationTitle(payload.title)
                    .toAnyView()
            } else {
                destinationView = EmptyView().toAnyView()
            }
        case .menuComments:
           if let payload = payload as? RowUIModel {
               destinationView = MenuCommentsViewFactory.make().toAnyView()
                    .navigationTitle(payload.title)
                    .toAnyView()
            } else {
                destinationView = EmptyView().toAnyView()
            }
        }
        
        switch action.type {
        case .sheet:
            return SheetView(content: {
                content()
            }, destinationView: destinationView).toAnyView()
        case .push:
            return NavigationLink {
                destinationView
            } label: {
                content()
            }.toAnyView()
        }
    }
}

