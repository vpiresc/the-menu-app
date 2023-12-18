import Foundation
import SwiftUI

enum RatingSize: CGFloat {
    case small = 10
    case normal = 20
}

struct RatingView: View {
    @Binding var rating: Int?
    var size: RatingSize = .normal
    
    private func starType(index: Int) -> String {
        if let rating = self.rating {
            return index <= rating ? "star.fill" : "star"
        } else {
            return "star"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Image(systemName: self.starType(index: index)).resizable()
                    .foregroundColor(Color.orange)
                    .frame(width: size.rawValue, height: size.rawValue)
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(2))
    }
}
