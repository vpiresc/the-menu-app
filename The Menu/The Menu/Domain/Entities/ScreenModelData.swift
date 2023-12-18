struct ScreenModelData: Decodable {
    let pageTitle: String
    let components: [ComponentModel]
}
@MainActor 
extension ScreenModelData {
    func buildComponents() throws -> [UIComponent] {
        var components : [UIComponent] = []
        let navigator = Navigator()
        for component in self.components {
            switch component.type {
            case .featuredImage:
                guard let uiModel: FeaturedImageUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(FeaturedImageComponent(uiModel: uiModel))
            case .carousel:
                guard let uiModel: CarouselUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(CarouselComponent(uiModel: uiModel, navigator: navigator))
            case .textRow:
                guard let uiModel: TextRowUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(TextRowComponent(uiModel: uiModel))
            case .rating:
                guard let uiModel: RatingUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(RatingComponent(uiModel: uiModel))
            case .list:
                guard let uiModel: ListUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(ListComponent(uiModel: uiModel, navigator: navigator))
            case .commentList:
                guard let uiModel: CommentListUIModel = component.data.decode() else {
                    throw ComponentError.decodingError
                }
                components.append(CommentListComponent(uiModel: uiModel))
            case .none:
                components.append(EmptyComponent())
            }
        }
        return components
    }
}
