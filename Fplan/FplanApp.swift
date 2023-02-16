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
