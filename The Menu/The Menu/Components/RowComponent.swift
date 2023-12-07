import Foundation
import SwiftUI

struct RowComponent: UIComponent {
    let id = UUID()
    let uiModel: RowUIModel
    
    func render() -> AnyView {
        HStack {
            if let imageUrl = uiModel.imageUrl {
                AsyncImage(url: imageUrl) { image in
                    image.resizable()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }.toAnyView()
            }
            
            VStack(alignment: .leading) {
                Text(uiModel.title).font(.system(size: 18))
                Text(uiModel.subTitle ?? "").opacity(0.4).font(.system(size: 16))
                Text(uiModel.description ?? "").font(.system(size: 14))
            }
        }.padding()
            .toAnyView()
    }
}
