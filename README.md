# ExpoFP Fplan - iOS library for displaying expo plans

This is an example of how you can integrate ExpoFP maps into an ios(SwiftUI) application.

Documentation: https://github.com/expofp/expofp-ios-sdk

## Code example

```swift
import SwiftUI
import FplanKit

@main
struct FplanApp: App {
    
    @State var url: String = "https://demo.expofp.com"
    @State var selectedBooth: String? = nil
    @State var route: Route? = nil
    @State var currentPosition: BlueDotPoint? = nil
    
    func selectBooth() {
        self.route = nil
        self.currentPosition = nil
        self.selectedBooth = "720"
    }
    
    func buildRoute() {
        self.selectedBooth = nil
        self.route = Route(from: "720", to: "751", exceptInaccessible: false)
    }
    
    func setPosition() {
        self.selectedBooth = nil
        self.currentPosition = BlueDotPoint(x: 22270, y: 44900)
    }
    
    func clear() {
        self.currentPosition = nil
        self.route = nil
        self.selectedBooth = ""
    }
    
    func fpReady() {
        print("[Fplan] - fpReady")
    }
    
    func directionReady(direction: Direction){
        print("[Fplan] - directionReady")
        print(direction)
    }
    
    var body: some Scene {
        WindowGroup {
            VStack
            {
                //noOverlay - Hides the panel with information about exhibitors
                FplanView(url, noOverlay: false, selectedBooth: $selectedBooth, route: route, currentPosition: currentPosition,
                          fpReadyAction: fpReady, buildDirectionAction: directionReady)
                HStack
                {
                    Spacer()
                    Button("Select booth", action: selectBooth)
                    Spacer()
                    Button("Build route", action: buildRoute)
                    Spacer()
                    Button("Set position", action: setPosition)
                    Spacer()
                    Button("Clear", action: clear)
                    Spacer()
                }
            }
        }
    }
}

```

## Screenshot

<img src="https://user-images.githubusercontent.com/60826376/171376998-9e30f8a8-d938-4e4e-9554-e8d8e5a90211.png" width=40%>

