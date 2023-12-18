import Foundation
import SwiftUI

protocol MenuCommentsViewModelDisplayLogic {
    func displayData() async
}

protocol MenuCommentsViewModelInputLogic {
    func prepareData() async throws
}

@MainActor
protocol MenuCommentsViewModelOutputLogic {
    var components: [UIComponent] { get }
}

protocol MenuCommentsViewModel: MenuCommentsViewModelOutputLogic, MenuCommentsViewModelInputLogic, ObservableObject {}
