import SwiftUI

struct CarouselView: View {
    
    let uiModel: CarouselUIModel
    let navigator: Navigator
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20){
                ForEach(uiModel.items) { item in
                    VStack {
                        navigator.perform(action: uiModel.action, payload: item) {
                            AsyncImage(url: item.imageUrl) { image in
                                image
                                    .resizable()
                                    .frame(width: 150, height: 150)
                                    .cornerRadius(20)
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        Text(item.itemTitle)
                            .textCase(.uppercase)
                            .font(.system(size: 14))
                    }.toAnyView()
                }.toAnyView()
            }.padding()
        }.scrollIndicators(.hidden)
    }
}
