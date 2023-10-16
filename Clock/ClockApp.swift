import SwiftUI

@main
struct ClockApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                TimeView().tabItem { Label("Time Converter", systemImage: "clock") }
                ZonesView().tabItem { Label("Time Zones", systemImage: "globe") }
                AboutView().tabItem { Label("About", systemImage: "book.pages") }
            }
        }
    }
}
