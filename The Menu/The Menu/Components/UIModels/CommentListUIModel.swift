import Foundation

struct CommentUIModel: Decodable {
    let id: Int
    let title: String
    let subTitle: String?
    let imageUrl: URL?
    let description: String?
    let rating: Int
}

struct CommentListUIModel: Decodable {
    let comments: [CommentUIModel]
}
