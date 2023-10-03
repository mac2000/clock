import SwiftUI

@main
struct ClockApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                TimeView().tabItem { Label("Time", systemImage: "clock") }
                AboutView().tabItem { Label("About", systemImage: "globe") }
            }
        }
    }
}
