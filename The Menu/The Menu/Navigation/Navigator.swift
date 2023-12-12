import Foundation
import SwiftUI

struct SheetView<V: View>: View {
    @State private var isPresented: Bool = false
    let content: () -> V
    let destinationView: AnyView
    
    var body: some View {
        content().onTapGesture {
            isPresented = true
        }.sheet(isPresented: $isPresented) {
            destinationView
        }
    }
}

class Navigator {
    func perform<V: View>(action: Action, payload: Any? = nil, content: @escaping () -> V) -> AnyView {
        var destinationView: AnyView!
        
        switch action.destination {
        case .menuItemDetail:
            if let payload = payload as? CarouselItemUIModel {
                destinationView = MenuItemDetailScreen(itemId: payload.itemId).toAnyView()
            } else if let payload = payload as? RowUIModel {
                destinationView = MenuItemDetailScreen(itemId: payload.id)
                    .navigationTitle(payload.title)
                    .toAnyView()
            } else {
                destinationView = EmptyView().toAnyView()
            }
        case .menuComments:
           if let payload = payload as? RowUIModel {
                destinationView = MenuCommentsScreen()
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

