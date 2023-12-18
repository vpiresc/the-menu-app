import Foundation

struct CarouselItemUIModel: Decodable, Identifiable {
    let id = UUID()
    let itemId: Int
    let imageUrl: URL
    let itemTitle: String
    
    private enum CodingKeys: String, CodingKey {
        case itemId
        case imageUrl
        case itemTitle
    }
}

struct CarouselUIModel: Decodable {
    let items: [CarouselItemUIModel]
    let action: Action
}
