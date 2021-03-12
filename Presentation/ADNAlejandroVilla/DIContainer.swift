//
//  File.swift
//  ADNAlejandroVilla
//
//  Created by Alejandro Villa Cardenas - Ceiba Software on 12/03/21.
//

import Foundation
import DataAccess
import Domain
import Swinject

public class DIContainer {
    
    private let container: Container = Container()
    
    func registerDependencies() {
        
        container.register(ParkingRepository.self) {
            _ in RealmPersistence()
        }
        
        container.register(ParkingManager.self) {
            repository in ParkingManager(persistence: repository.resolve(ParkingRepository.self)!)
        }
    }
    
    func getContainer() -> Container {
        return container
    }
}
