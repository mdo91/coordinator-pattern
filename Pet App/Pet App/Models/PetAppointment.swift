//
//  PetAppointment.swift
//  Pet App
//
//  Created by Mahmoud Aoata on 22.03.2022.
//

import Foundation

public struct PetAppointment{
    
    //MARK: - Instance Properties
    
    public let date:Date
    public let painLevel:PainLevel
    public let visitType:VisitType
    
}

//MARK: - PetAppointmentBuilder

public class PetAppointmentBuilder{
    
    //MARK: - Instance Properties
    
    public var date = Date()
    public var painLevel = PainLevel.none
    public var visitType = VisitType.well
    
    //MARK: - Builder Methods
    
    public func build() -> PetAppointment{
        return PetAppointment(date: date, painLevel: painLevel, visitType: visitType)
    }
}
