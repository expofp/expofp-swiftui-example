import SwiftUI
import ExpoFpCommon
import ExpoFpFplan
import ExpoFpCrowdConnected

@main
struct FplanApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MapView()
            }
        }
    }
}
