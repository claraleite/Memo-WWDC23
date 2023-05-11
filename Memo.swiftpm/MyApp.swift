import SwiftUI

@main
struct MyApp: App {

    init() {
        playSoundtrack(sound: "memo soundtrack")
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MenuView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            
            
        }
    }
}
