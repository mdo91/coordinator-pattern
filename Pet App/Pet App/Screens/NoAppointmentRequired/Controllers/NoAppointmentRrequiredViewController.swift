//
//  NoAppointmentRrequiredViewController.swift
//  Pet App
//
//  Created by Mahmoud Aoata on 8.03.2022.
//

import UIKit

//MARK: - NoAppointmentRequiredViewControllerDelegate

public protocol NoAppointmentViewControllerDelegate:class{
    
    func noAppointmentViewControllerDidPressOkay(_ controller: NoAppointmentRrequiredViewController)
}


//MARK: - NoAppointmentViewController
public class NoAppointmentRrequiredViewController: UIViewController {

    
    //MARK: - Instance Properties
    
    public weak var delegate: NoAppointmentViewControllerDelegate?
    
    @IBAction public func didPressOkay(_ sender: AnyObject){
        delegate?.noAppointmentViewControllerDidPressOkay(self)
    }
    
}

//MARK: - StoryboardInstance

extension NoAppointmentRrequiredViewController:StoryboardInstantiable{
    public class func instantiate(delegate: NoAppointmentViewControllerDelegate) -> NoAppointmentRrequiredViewController{
        let viewController = instanceFromStoryboard()
        viewController.delegate = delegate
        return viewController
    }
}
