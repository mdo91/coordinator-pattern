//
//  SelectVisitTypeViewController.swift
//  Pet App
//
//  Created by Mahmoud Aoata on 18.04.2022.
//

import Foundation
import UIKit

//MARK: - SelectVisitTypeViewControllerDelegate

public protocol SelectVisitTypeViewControllerDelegate:class{
    func selectVisitTypeViewController(_ controller:SelectVisitTypeViewController,
                                       didSelect vistType: VisitType)
}

//MARK: - SelectVisitTypeViewController

public class SelectVisitTypeViewController:UIViewController{
    
    //MARK: - Instance Properties
    
    public weak var delegate:SelectVisitTypeViewControllerDelegate?
    
    @IBAction internal func didSelectWellVisit(_ sender:AnyObject){
        delegate?.selectVisitTypeViewController(self, didSelect: .well)
    }
    
    @IBAction internal func didSelectSickVisit(_ sender:AnyObject){
        delegate?.selectVisitTypeViewController(self, didSelect: .sick)
    }
}

//MARK: - StoryboardInstantiable
extension SelectVisitTypeViewController:StoryboardInstantiable{
    
    public class func instantiate(delegate:SelectVisitTypeViewControllerDelegate) -> SelectVisitTypeViewController{
        let viewController = instanceFromStoryboard()
        viewController.delegate = delegate
        return viewController
    }
}
