// ViewModel/MapaViewModel.swift
import SwiftUI
import MapKit
import CoreLocation

@Observable
final class MapaViewModel {
    
    var posicaoCamera: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -14.5, longitude: -51.0),
            span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40)
        )
    )
    
    var permissaoLocalizacao: CLAuthorizationStatus = .notDetermined
    private let gerenciadorLocalizacao = CLLocationManager()
    
    func solicitarPermissao() {
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
    }
    
    func centralizarNoUsuario() {
        guard let local = gerenciadorLocalizacao.location else { return }
        posicaoCamera = .region(
            MKCoordinateRegion(
                center: local.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
            )
        )
    }
    
    
}
