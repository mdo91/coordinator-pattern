//
//  Coordinator.swift
//  Pet App
//
//  Created by Mahmoud Aoata on 18.04.2022.
//
public protocol Coordinator:class{
    
    var children:[Coordinator] {get set}
    var router:Router {get}
    
    func present(animated:Bool, onDismissed: (() ->Void)?)
    func dismiss(animated:Bool)
    func presentChild(_ child:Coordinator, animated:Bool, onDismissed: (()->Void)?)
    
    
}
extension Coordinator{
    
    public func dismiss(animated:Bool){
        router.dismiss(animated: true)
    }
    
    public func presentChild(_ child:Coordinator, animated:Bool, onDismissed:(()->Void)? = nil){
        children.append(child)
        child.present(animated: animated, onDismissed: {
            [weak self, weak child] in
            
            guard let self = self, let child = child else{ return}
            
            onDismissed?()
        
        })
    }
    
    private func removeChild(_ child:Coordinator){
        guard let index = children.firstIndex(where: {$0 === child}) else{
            return
        }
        children.remove(at: index)
    }
}