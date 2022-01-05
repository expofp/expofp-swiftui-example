import SwiftUI
import FplanKit

@main
struct FplanApp: App {
    
    func fpReadyCallback(){
        //Some code
    }
    
    func boothSelectionCallback(boothName: String){
        //Some code
    }
    
    func routeBuildCallback(route: Route){
        //Some code
    }
    
    var body: some Scene {
        WindowGroup {
            FplanView("https://developer.expofp.com/examples/autumnfair.html",
                      fplanReadyHandler: fpReadyCallback,
                      boothSelectionHandler: boothSelectionCallback,
                      routeBuildHandler: routeBuildCallback)
        }
    }
}
