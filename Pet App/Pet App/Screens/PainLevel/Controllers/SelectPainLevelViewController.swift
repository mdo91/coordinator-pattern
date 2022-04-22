//
//  SelectPainLevelViewController.swift
//  Pet App
//
//  Created by Mahmoud Aoata on 21.03.2022.
//

import UIKit

//MARK: - SelectPainLevelViewControllerDelegate

public protocol SelectPainLevelViewControllerDelegate:class{
    func selectPainLevelViewController(_ controller:SelectPainLevelViewController,
                                       didSelect painLevel:PainLevel)
}

//MARK: - SelectPainLevelViewController

public class SelectPainLevelViewController:UIViewController{
    
    //MARK: - Instance Properties
    
    public weak var delegate:SelectPainLevelViewControllerDelegate?
    
    private var pageViewController:UIPageViewController!
    private let painLevelViewControllers = [
        PainLevelViewController.instantiate(description: "Not At all", image: UIImage(named: "pain_level_none")!, painLevel: .none),
        PainLevelViewController.instantiate(description: "A little pain", image: UIImage(named: "pain_level_little")!, painLevel: .little),
        PainLevelViewController.instantiate(description: "Moderate pain", image: UIImage(named: "pain_level_moderate")!, painLevel: .moderate),
        PainLevelViewController.instantiate(description: "severe pain!", image: UIImage(named: "pain_level_severe")!, painLevel: .sever),
        PainLevelViewController.instantiate(description: "worst pain possible!!!", image: UIImage(named: "pain_level_worst_possible")!, painLevel: .worstPossible)
    ]
    
    //MARK: - view lifecycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()
    }
    
    private func configurePageControl(){
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [SelectPainLevelViewController.self])
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor  = .lightGray
    }
    
    //MARK: - Segue
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let pageViewController = segue.destination as? UIPageViewController else {return}
        pageViewController.setViewControllers([painLevelViewControllers.first!], direction: .forward, animated: false, completion: nil)
        pageViewController.dataSource = self
        self.pageViewController = pageViewController
    }
    
    @IBAction internal func didPressOkayButton(_ sender: AnyObject){
        let painViewController = pageViewController.viewControllers!.first! as! PainLevelViewController
        delegate?.selectPainLevelViewController(self, didSelect:painViewController.painLevel )
    }
}

//MARK: - UIPageViewControllerDataSource

extension SelectPainLevelViewController:UIPageViewControllerDataSource{
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = painLevelViewControllers.firstIndex(where: {$0 === viewController}), index > 0 else {return nil}
        return painLevelViewControllers[index - 1]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = painLevelViewControllers.firstIndex(where: {$0 === viewController}), index < painLevelViewControllers.count - 1 else {return nil}
        return painLevelViewControllers[index + 1]
    }
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        
        return painLevelViewControllers.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let viewController = pageViewController.viewControllers?.first,
              let index = painLevelViewControllers.lastIndex(where: {$0 === viewController})else{
                  return 0
              }
        return index
    }
    
}

//MARK: - StoryboardInstantiable

extension SelectPainLevelViewController:StoryboardInstantiable{
    
    public class func instantiate(delegate:SelectPainLevelViewControllerDelegate) -> SelectPainLevelViewController{
        
        let viewController = instanceFromStoryboard()
        viewController.delegate  = delegate
        return viewController
    }
}
