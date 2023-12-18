struct ScreenModelResponse: Decodable {
    let pageTitle: String
    let components: [ComponentModel]
}

struct ComponentModel: Decodable {
    let type: ComponentType?
    let data: [String: Any]
    
    private enum CodingKeys: CodingKey {
        case type
        case data
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try? container.decode(ComponentType.self, forKey: .type)
        self.data = try container.decode(JSON.self, forKey: .data).value as! [String: Any]
    }
}
