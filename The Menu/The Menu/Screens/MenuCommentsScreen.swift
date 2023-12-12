//
//  MenuCommentsScreen.swift
//  The Menu
//
//  Created by Vitor Pires on 12/12/23.
//

import SwiftUI

struct MenuCommentsScreen: View {
    @StateObject private var viewModel = MenuCommentsViewModel(service: Webservice())
    
    var body: some View {
        ScrollView {
            ForEach(viewModel.components, id: \.id) { component in
                component.render()
            }
        }.navigationTitle("Menu Comments")
            .id(UUID())
            .listStyle(.plain)
            .task {
                await viewModel.load()
            }
    }
}


struct MenuCommentsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuCommentsScreen()
    }
}
