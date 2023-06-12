import SwiftUI
import UIKit

class ExternalSceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard
            let appDelegate = UIApplication.shared.delegate as? AppDelegate,
            let scene = scene as? UIWindowScene
        else { return }

        let window = UIWindow(windowScene: scene)
        window.rootViewController = UIHostingController(rootView: ExternalRootView(model: appDelegate.model))
        window.isHidden = false
        self.window = window
    }
}
