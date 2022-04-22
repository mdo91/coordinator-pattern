//
//  PainLevelViewController.swift
//  Pet App
//
//  Created by Mahmoud Aoata on 21.03.2022.
//

import UIKit

public class PainLevelViewController:UIViewController{
    
    //MARK: - Instance Properties
    
    public private(set) var painDescription:String!
    public private(set) var painImage:UIImage!
    public private(set) var painLevel:PainLevel!
    
    //MARK: - Outlets
    @IBOutlet public var imageView:UIImageView!
    @IBOutlet public var label:UILabel!
    
    //MARK: - Lifecycle
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = painImage
        label.text = painDescription
    }
}

//MARK: - StoryboardInstantiable

extension PainLevelViewController:StoryboardInstantiable{
    
    public static let storyboardFileName = "SelectPainLevel"
    
    public class func instantiate(description painDescription: String,
                                  image:UIImage,
                                  painLevel:PainLevel) -> PainLevelViewController{
        let viewController = instanceFromStoryboard()
        viewController.painDescription = painDescription
        viewController.painImage = image
        viewController.painLevel = painLevel
        return viewController
    }
}


