import Foundation

struct Constants {
    struct Urls {
        static let baseUrl = "http://localhost:3000"
        static let menuList = "\(baseUrl)/menu-list"
        static let menuComments = "\(baseUrl)/menu-comments"
        static func menuItemDetail(itemId: Int) -> String {
            return "\(baseUrl)/menu-item-detail/\(itemId)"
        }
    }
}
