import Foundation
import SwiftUI

protocol MenuListViewModelDisplayLogic {
    func displayData() async
}

protocol MenuListViewModelInputLogic {
    func prepareData() async throws
}

@MainActor
protocol MenuListViewModelOutputLogic {
    var components: [UIComponent] { get }
}

protocol MenuListViewModel: MenuListViewModelOutputLogic, MenuListViewModelInputLogic, ObservableObject {}
