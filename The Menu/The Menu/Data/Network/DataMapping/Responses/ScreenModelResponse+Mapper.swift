extension ScreenModelResponse {
    func toData() -> ScreenModelData {
        .init(
            pageTitle: self.pageTitle,
            components: self.components
        )
    }
}
