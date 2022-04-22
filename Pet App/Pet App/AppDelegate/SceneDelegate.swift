//
//  SceneDelegate.swift
//  Pet App
//
//  Created by Mahmoud Aoata on 24.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

   // var window: UIWindow?
    
    //MARK: - Instance Properties
    
    public lazy var window:UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    public lazy var coordinator = HomeCoordinator(router: router)
    public lazy var router = AppDelegateRouter(window: window!)


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

       // guard let _ = (scene as? UIWindowScene) else { return }
        coordinator.present(animated: true, onDismissed: nil)
     //   return true
    }



}

