//
//  RootViewModel.swift
//  Memo
//
//  Created by mccl on 18/04/23.
//

// CREDITS

// Thanks Rob Kerr for this piece of code at: https://rekerrsive.medium.com/three-ways-to-pop-to-the-root-view-in-a-swiftui-navigationview-430aee720c9a
// And thanks to Lopau for updating it to iOS 16 at: https://www.lopau.com/how-to-solve-windows-was-deprecated-in-ios-15-0-use-uiwindowscene-windows-on-a-relevant-window-scene-instead-warning-in-swift/

import UIKit

struct PopToRootModel {
    
    static func popToRootView() {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        findNavigationController(viewController: window?.rootViewController)?
            .popToRootViewController(animated: true)
    }
    
    static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
        guard let viewController = viewController else {
            return nil
        }
        
        if let navigationController = viewController as? UINavigationController {
            return navigationController
        }
        
        for childViewController in viewController.children {
            return findNavigationController(viewController: childViewController)
        }
        return nil
    }
    
}
