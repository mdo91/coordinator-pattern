//
//  PetAppointCoordinator.swift
//  Pet App
//
//  Created by Mahmoud Aoata on 18.04.2022.
//

import Foundation
public class PetAppointBuilderCoordinator:Coordinator{

    
    
    public var router: Router
    
    public let builder = PetAppointmentBuilder()
    public var children: [Coordinator] = []
    
    //MARK: - children Lifecycle
    
    public init(router:Router){
        self.router = router
    }
    
    public func present(animated: Bool, onDismissed: (() -> Void)?) {
        let viewController = SelectVisitTypeViewController.instantiate(delegate: self)
        router.present(viewController, animated: animated, onDismissed: onDismissed)
    }
}

extension PetAppointBuilderCoordinator:SelectVisitTypeViewControllerDelegate{
    
    
    public func selectVisitTypeViewController(_ controller: SelectVisitTypeViewController, didSelect vistType: VisitType) {
        //TODO:
        
        builder.visitType = vistType
        
        switch vistType {
        case .sick:
            presentNoAppointmentViewController()
        case .well:
            presentSelectPainLevelCoordinator()
        }
    }
    
    private func presentNoAppointmentViewController(){
        
        let viewController = NoAppointmentRrequiredViewController.instantiate(delegate: self)
        router.present(viewController, animated: true)

    }
    
    private func presentSelectPainLevelCoordinator(){
        
        let viewController = SelectPainLevelViewController.instantiate(delegate: self)
        router.present(viewController, animated: true)
        
    }
    
}

//MARK: - SelectPainLevelViewControllerDelegate

extension PetAppointBuilderCoordinator:SelectPainLevelViewControllerDelegate{
    public func selectPainLevelViewController(_ controller: SelectPainLevelViewController, didSelect painLevel: PainLevel) {
        builder.painLevel = painLevel
        
        switch painLevel {
        case .none, .little:
            presentFakingItViewController()

        case .moderate, .sever, .worstPossible:
            presentNoAppointmentViewController()

        }
    }
    
    private func presentFakingItViewController(){
        let viewController = FackingItViewController.instantiate(delegate: self)
        router.present(viewController, animated: true)
    }
    
    
}

extension PetAppointBuilderCoordinator:FakingItViewControllerDelegate{

    
    public func fakingItViewControllerPressedNotFake(_ controller: FackingItViewController) {
        
        presentNoAppointmentViewController()
        
    }
    
    public func fakingItViewContorllerPressedIsFake(_ controller: FackingItViewController) {
        router.dismiss(animated: true)
    }
}

extension PetAppointBuilderCoordinator:NoAppointmentViewControllerDelegate{
    
    public func noAppointmentViewControllerDidPressOkay(_ controller: NoAppointmentRrequiredViewController) {
        router.dismiss(animated: true)
    }
}
