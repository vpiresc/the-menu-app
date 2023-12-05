import Foundation

struct CarouselItemUIModel: Decodable, Identifiable {
    let id = UUID()
    let itemId: Int
    let imageUrl: URL
    
    private enum CodingKeys: String, CodingKey {
        case itemId
        case imageUrl
    }
}

struct CarouselUIModel: Decodable {
    let items: [CarouselItemUIModel]
    let action: Action
}
