//
//  AppDelegateRouter.swift
//  Pet App
//
//  Created by Mahmoud Aoata on 18.04.2022.
//

import UIKit


public class AppDelegateRouter:Router{

    

    
    
    public let window:UIWindow
    
    
    //MAKR: - object life cycle
    
    public init(window:UIWindow){
        
        self.window = window
    }
    
    public func present(_ viewController: UIViewController,
                        animated: Bool, onDismissed: (()-> Void)?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }

    
    public func dismiss(animated: Bool) {
        
    }
}
