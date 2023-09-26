# ExpoFP Fplan - iOS library for displaying expo plans

This is an example of how you can integrate ExpoFP floor plan into an iOS(SwiftUI) application.

Documentation: https://expofp.github.io/expofp-mobile-sdk/ios-sdk/

## Installation

```js
  pod 'ExpoFpFplan', '4.2.7'
```

## Code example

```swift
import SwiftUI
import ExpoFpCommon
import ExpoFpFplan

@main
struct FplanApp: App {

    let fplanView = FplanView()
    
    func selectBooth() {
        fplanView.selectBooth("305")
    }
    
    func buildRoute() {
        fplanView.selectRoute(Route(from: "305", to: "339", exceptInaccessible: false))
    }
    
    func setPosition() {
        fplanView.setCurrentPosition(BlueDotPoint(x: 45000.00, y: 14000.00), true)
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
                         print("[OnFpReady]")
                     }
                     .onFpError { errorCode, description in
                         print("[OnFpError]")
                     }
                     .onBoothClick { id, name in
                         print("[OnBoothClick] id=\(id); name=\(name)")
                     }
                     .onBuildDirection { direction in
                         print("[OnBuildDirection]")
                         print(direction)
                     }
                     .onDetailsClick { details in
                         print("[OnDetailsClick]")
                         print(details)
                     }
                     .onExhibitorCustomButtonClick { externalId, buttonNumber, buttonUrl in
                         print("[OnExhibitorCustomButtonClick] externalId=\(externalId); buttonNumber=\(buttonNumber); buttonUrl=\(buttonUrl)")
                     }
                     .onAppear{
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

