//
//  Mapmodel.swift
//  tempo
//
//  Created by Pedro Monge Silveira on 20/07/26.
//

// Model/ConfiguracaoMapa.swift
import Foundation
import CoreLocation

struct ConfiguracaoMapa {
    var centro: CLLocationCoordinate2D
    var zoom: Double
    
    static let padrao = ConfiguracaoMapa(
            centro: CLLocationCoordinate2D(latitude: -14.5, longitude: -51.0),
            zoom: 40
    )
}
