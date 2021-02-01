//
//  Detector.swift
//  BeaconDetector
//
//  Created by Marcy Vernon on 11/20/20.
//

import Foundation
import CoreLocation
import SwiftUI

class Detector: NSObject, ObservableObject {
    
    var locationManager = CLLocationManager()
    var showAlert = false
    
    @Published var lastDistance     = K.emptyString
    @Published var major : NSNumber = 0
    @Published var minor : NSNumber = 0
    @Published var beaconID         = K.emptyString
    @Published var titleString      = K.emptyString
    @Published var imageString      = K.defaultImage
    @Published var textDescription  = K.emptyString
    @Published var bgColor          = Color("Unknown")
    @Published var alert            = K.emptyString
    @Published var exhibitTitle     = K.emptyString
    @Published var roomTitle        = K.emptyString
    @Published var speach           = K.emptyString
    
    override init () {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        verifyPrivacyAuthorization()
    }
    
    func verifyPrivacyAuthorization() {
        if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
            startScanning()
        } else {
            showAlert = true
            alert = K.locationNeeded
            print("alert to change location settings")
        }
    }
    
    func startScanning() {
        
        guard let uuid = UUID(uuidString: K.uuid) else { return }
        
        let constraint = CLBeaconIdentityConstraint(uuid: uuid)
        let beaconRegion = CLBeaconRegion(beaconIdentityConstraint: constraint, identifier: K.beaconID)
        locationManager.startMonitoring(for: beaconRegion)
        locationManager.startRangingBeacons(satisfying: constraint)
    }

    
    func update(distance: CLProximity) -> (color: Color, distance: String) {
        switch distance {
            case .immediate : return (Color("Immediate"), BeaconStatus.immediate.rawValue)
            case .near      : return (Color("Near"), BeaconStatus.near.rawValue)
            case .far       : return (Color("Far"), BeaconStatus.far.rawValue)
            default         : return (Color("Unknown"), BeaconStatus.unknown.rawValue)
        }
    }
    
} // end of Detector


extension Detector: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {

        if status == .authorizedWhenInUse || status == .authorizedAlways {
            if CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) {
                if CLLocationManager.isRangingAvailable() {
                    startScanning()
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRange beacons: [CLBeacon], satisfying beaconConstraint: CLBeaconIdentityConstraint) {

        if let beacon = beacons.first {
            lastDistance = update(distance: beacon.proximity).distance
            bgColor      = update(distance: beacon.proximity).color
            major        = beacon.major
            minor        = beacon.minor
            beaconID     = beacon.description
            roomTitle    = "Room  \(beacon.major) - Exhibit \(beacon.minor)"
            
            let key: String = String(describing: major) + "-" + String(describing: minor)
            
            exhibitTitle    = K.dictExhibit[key]?.exhibit ?? K.emptyString
            titleString     = K.dictExhibit[key]?.title ?? K.emptyString
            imageString     = K.dictExhibit[key]?.image ?? K.defaultImage
            textDescription = K.dictExhibit[key]?.description ?? K.emptyString
            speach          = K.dictExhibit[key]?.speach ?? K.emptyString
        } else {
            lastDistance = BeaconStatus.unknown.rawValue
        }
    }
}




