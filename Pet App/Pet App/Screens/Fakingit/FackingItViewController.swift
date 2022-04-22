//
//  FackingItViewController.swift
//  Pet App
//
//  Created by Mahmoud Aoata on 3.03.2022.
//

import UIKit

//MARK: - FakingItViewControllerDelegate

public protocol FakingItViewControllerDelegate:class{
    
    func fakingItViewContorllerPressedIsFake(_ controller:FackingItViewController)
    func fakingItViewControllerPressedNotFake(_ controller:FackingItViewController)
}

public class FackingItViewController: UIViewController {

    
    //MARK: - Instance Properties
    
    public weak var delegate:FakingItViewControllerDelegate?

    
    //MARK: - Actions
    
    @IBAction public func didSelectFake(_ sender: AnyObject){
        delegate?.fakingItViewContorllerPressedIsFake(self)
    }
    
    @IBAction public func didSelectNotFake(_ sender: AnyObject){
        delegate?.fakingItViewControllerPressedNotFake(self)
    }
}

//MARK: - StoryBoardInstantiable

extension FackingItViewController:StoryboardInstantiable{
    public class func instantiate(delegate:FakingItViewControllerDelegate) -> FackingItViewController{
        
        let viewController = instanceFromStoryboard()
        viewController.delegate = delegate
        return viewController
    }

}
