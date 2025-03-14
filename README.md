# ExpoFP Fplan - iOS library for displaying expo plans

This is an example of how you can integrate ExpoFP floor plan into an iOS(SwiftUI) application.

Documentation: https://expofp.github.io/expofp-mobile-sdk/ios-sdk/

## Code example

```swift
import SwiftUI
import ExpoFpCommon
import ExpoFpFplan
import ExpoFpCrowdConnected

struct MapView: View {
    
    let fplanView = FplanView()
    
    func selectBooth() {
        fplanView.selectBooth("4.1-31")
    }
    
    func buildRoute() {
        fplanView.selectRoute(Route(from: "4.1-37", to: "4.1-11", exceptInaccessible: false))
    }
    
    func setPosition() {
        fplanView.setCurrentPosition(BlueDotPoint(x: 9388.00, y: 9887.00, z: "1"), true)
    }
    
    func clear() {
        fplanView.clear()
    }
    
    var body: some View {
        VStack {
            fplanView.onFpReady{
                print("[OnFpReady]")
            }
            .onFpError { errorCode, description in
                print("[OnFpError]")
            }
            .onBoothClick { booth in
                print("[OnBoothClick] id=\(booth.id); name=\(booth.name)")
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
```
