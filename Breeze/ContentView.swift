import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VisualEffectBlurView()
            
            // Overlay a semi-transparent black color for the smoky look
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            // Your content goes here
            VStack {
                Text("Your content")
                    .padding()
                    .foregroundColor(.white)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
