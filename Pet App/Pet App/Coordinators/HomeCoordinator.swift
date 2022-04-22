//
//  HomeCoordinator.swift
//  Pet App
//
//  Created by Mahmoud Aoata on 18.04.2022.
//

import Foundation
import UIKit


public class HomeCoordinator:Coordinator{

    
    //MARK: - Instance Properties
    
    public var children: [Coordinator] = []
    public var router: Router
    
    //MARK: - Object Lifecycle
    
    public init(router:Router){
        self.router = router
    }
    
    //MARK: - Instance Methods
    
    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = HomeViewController.instantiate(delegate: self)
        
        router.present(viewController, animated: animated, onDismissed: onDismissed)
    }
}

extension HomeCoordinator:HomeViewControllerDelegate{
    
    public func homeViewControllerDidPressScheduleAppointment(_ viewController: HomeViewController) {
        // todo present
        
        let router = ModalNavigationRouter(parentViewController: viewController)
        let coordinator = PetAppointBuilderCoordinator(router: router)
        
        presentChild(coordinator, animated: true)
    }
}
