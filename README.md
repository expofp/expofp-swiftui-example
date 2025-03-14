# ExpoFP Fplan - iOS library for displaying expo plans

This is an example of how you can integrate ExpoFP floor plan into an iOS(SwiftUI) application.

Documentation: https://expofp.github.io/expofp-mobile-sdk/ios-sdk/

## Code example

```swift
import SwiftUI
import ExpoFpCommon
import ExpoFpFplan
import ExpoFpCrowdConnected
import ExpoFpIndoorAtlas

struct MapView: View {
    
    let fplanView = FplanView()
    
    func load(){
        fplanView.load("https://demo.expofp.com?noOverlay=true")
    }
    
    func loadOffline(){
        fplanView.downloadZipToCache("https://demo.expofp.com") { filePath, error in
            fplanView.openFileFromCache(params: "noOverlay=true", settings: Settings())
        }
    }
    
    func loadWithCrowdConnectedProvider(){
        var lp: LocationProvider = CrowdConnectedProvider(ExpoFpCrowdConnected.Settings(appKey:"APP_KEY", token: "TOKEN", secret: "SECRET", mode: ExpoFpCrowdConnected.Mode.IPS_ONLY))
        GlobalLocationProvider.initialize(lp)
        GlobalLocationProvider.start()
        
        fplanView.load("https://demo.expofp.com?noOverlay=true", useGlobalLocationProvider: true)
    }
    
    func loadWithIndoorAtlasProvider(){
        var lp: LocationProvider = IndoorAtlasProvider(ExpoFpIndoorAtlas.Settings("API_KEY", "API_SECRET_KEY"))
        GlobalLocationProvider.initialize(lp)
        GlobalLocationProvider.start()
        
        fplanView.load("https://demo.expofp.com?noOverlay=true", useGlobalLocationProvider: true)
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
                load()
            }
            .toolbar {
                ToolbarItem {
                    Button("Select booth", action: { fplanView.selectBooth("4.1-31") })
                }
                ToolbarItem {
                    Button("Build route", action: { fplanView.selectRoute(Route(from: "4.1-37", to: "4.1-11", exceptInaccessible: false)) })
                }
                ToolbarItem {
                    Button("Set position", action: { fplanView.setCurrentPosition(BlueDotPoint(x: 9388.00, y: 9887.00, z: "1"), true) })
                }
                ToolbarItem {
                    Button("Clear", action: { fplanView.clear() })
                }
            }
        }
    }
}

```
