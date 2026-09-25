import SwiftUI

@main
struct AmbraVoiceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16) {
            Text("小灯")
                .font(.largeTitle)
                .bold()
            Text("壳跑起来了 —— 这条是 Nova 从 Windows 上推上去、云端 mac 编出来的。")
                .font(.footnote)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
        }
        .padding()
    }
}
