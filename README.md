# ExpoFP Fplan - iOS library for displaying expo plans

This is an example of how you can integrate ExpoFP maps into an ios(SwiftUI) application.

Documentation: https://expofp.github.io/expofp-mobile-sdk/ios-sdk/

## Code example

```swift
import SwiftUI
import ExpoFpCommon
import ExpoFpFplan
import ExpoFpGpsProvider
import ExpoFpCrowdConnected
import ExpoFpIndoorAtlas

@main
struct FplanApp: App {

    let fplanView = FplanView()
    
    func selectBooth() {
        fplanView.selectBooth("656")
    }
    
    func buildRoute() {
        fplanView.buildRoute(Route(from: "519", to: "656", exceptInaccessible: false))
    }
    
    func setPosition() {
        fplanView.setCurrentPosition(BlueDotPoint(latitude: 38.180023, longitude: -85.845180), true)
    }
    
    func clear() {
        fplanView.clear()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                VStack
                {
                     fplanView.onFpReady{
                         print("[Fplan] - onFpReady")
                     }
                     .onBoothClick{ boothName in
                         print("[Fplan] - onBoothClick: \(boothName)")
                     }
                     .onBuildDirection { direction in
                         print("[Fplan] - onBuildDirection:")
                         print(direction)
                     }
                     .onAppear{
                         
                         var lp: LocationProvider? = nil
                         
                         //Uncomment if you want to use any location provider
                         //lp = CrowdConnectedProvider(Settings("APP_KEY", "TOKEN", "SECRET"))
                         //lp = IndoorAtlasProvider(Settings("API_KEY", "API_SECRET_KEY"))
                         //lp = GpsProvider()
                         
                         fplanView.load("demo.expofp.com")
                     }
                     .onDisappear {
                         fplanView.destoy()
                     }
                    .toolbar {
                        ToolbarItem {
                            Button("Select booth", action: selectBooth)
                        }
                        ToolbarItem {
                            Button("Build route", action: buildRoute)
                        }
                        ToolbarItem {
                            Button("Set position", action: setPosition)
                        }
                        ToolbarItem {
                            Button("Clear", action: clear)
                        }
                    }
                }
                
            }
        }
    }
}
```

## Screenshot

<img src="https://user-images.githubusercontent.com/60826376/171376998-9e30f8a8-d938-4e4e-9554-e8d8e5a90211.png" width=40%>

