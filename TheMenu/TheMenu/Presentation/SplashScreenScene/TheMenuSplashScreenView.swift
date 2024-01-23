import SwiftUI
import Lottie

struct TheMenuSplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            MenuListViewFactory.make()
        } else {
            LottieView()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                        self.isActive = true
                    }
                }
        }
    }
}
