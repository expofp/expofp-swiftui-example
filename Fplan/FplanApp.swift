import SwiftUI
import ExpoFpCommon
import ExpoFpFplan

@main
struct FplanApp: App {

    let fplanView = FplanView()
    
    func selectBooth() {
        fplanView.selectBooth("656")
    }
    
    func buildRoute() {
        fplanView.selectRoute(Route(from: "519", to: "656", exceptInaccessible: false))
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
                         print("[OnFpReady]")
                     }
                     .onBoothClick{ id, name in
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
                         DispatchQueue.main.async {
                             fplanView.load("demo.expofp.com")
                         }
                     }
                     .onDisappear {
                         DispatchQueue.main.async {
                             fplanView.destoy()
                         }
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
