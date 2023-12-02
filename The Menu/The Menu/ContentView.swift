//
//  ContentView.swift
//  The Menu
//
//  Created by Vitor Pires on 01/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = MenuListViewModel(service: Webservice())
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.components, id: \.uniqueId) { component in
                    component.render()
                }
                .navigationTitle("The Menu")
            }.task {
                await viewModel.load()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
