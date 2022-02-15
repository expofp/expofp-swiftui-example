import SwiftUI
import FplanKit

@main
struct FplanApp: App {
    
    @State var url: String = "https://wayfinding.expofp.com"
    @State var selectedBooth: String? = nil
    @State var route: Route? = nil
    @State var currentPosition: Point? = nil
    
    func clear() {
        self.currentPosition = nil
        self.route = nil
        self.selectedBooth = ""
    }
    
    func selectBooth() {
        self.currentPosition = nil
        self.route = nil
        self.selectedBooth = "1306"
    }
    
    func buildRoute() {
        self.selectedBooth = nil
        self.currentPosition = Point(x: 2870, y: 1780)
        self.route = Route(from: "1306", to: "2206", exceptInaccessible: false)
    }
    
    func directionReady(direction: Direction){
    }
    
    var body: some Scene {
        WindowGroup {
            ZStack(alignment: .bottom)
            {
                FplanView(url, selectedBooth: $selectedBooth, route: route, currentPosition: currentPosition, buildDirectionAction: directionReady)
                HStack
                {
                    Spacer()
                    Button("Select booth", action: selectBooth)
                    Spacer()
                    Button("Build route", action: buildRoute)
                    Spacer()
                    Button("Clear", action: clear)
                    Spacer()
                }
            }
        }
    }
}
