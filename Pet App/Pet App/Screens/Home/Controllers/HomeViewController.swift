//
//  HomeViewController.swift
//  Pet App
//
//  Created by Mahmoud Aoata on 8.03.2022.
//

import UIKit


//MARK: - HomeViewConrollerDelegate

public protocol HomeViewControllerDelegate: class{
    
     func homeViewControllerDidPressScheduleAppointment(_ viewController:HomeViewController)
}

public class HomeViewController: UIViewController {

 //MARK: - Instance Properties
    
    public weak var delegate:HomeViewControllerDelegate?
    
    //MARK: - Actions
    
    
    @IBAction internal func didPressScheduleAppointment(_ sender:AnyObject){
        delegate?.homeViewControllerDidPressScheduleAppointment(self)
    }
}

extension HomeViewController:StoryboardInstantiable{
    public class func instantiate(delegate:HomeViewControllerDelegate) -> HomeViewController{
        let viewController = instanceFromStoryboard()
        viewController.delegate = delegate
        return viewController
    }
}
