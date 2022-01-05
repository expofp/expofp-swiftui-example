import SwiftUI
import FplanKit

@main
struct FplanApp: App {
    
    let fplanView: FplanView
    
    init() {
        func fplanReadyHandler(){
            //Some code
        }
        
        func boothSelectionHandler(boothName: String){
            //Some code
        }
        
        func routeBuildHandler(route: Route){
            //Some code
        }
        
        fplanView = FplanView("https://developer.expofp.com/examples/autumnfair.html",
                              fplanReadyHandler: fplanReadyHandler,
                              boothSelectionHandler: boothSelectionHandler,
                              routeBuildHandler: routeBuildHandler)
    }
    
    func selectBooth(_ boothName: String) {
        fplanView.selectBooth(boothName)
    }
    
    func selectBooth(_ from: String, _ to: String, _ exceptUnaccessible: Bool) {
        fplanView.buildRoute(from, to, exceptUnaccessible)
    }
    
    var body: some Scene {
        WindowGroup {
            fplanView
        }
    }
}
