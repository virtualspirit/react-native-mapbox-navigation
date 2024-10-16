//
//  MapboxNavigationViewManager.swift
//  react-native-mapbox-navigation
//
//  Created by Pawan Kushwaha on 10/07/2024.
//

import React

@objc(MapboxNavigationViewManager)
class MapboxNavigationViewManager: RCTViewManager {
    override func view() -> UIView! {
        return MapboxNavigationView();
    }
    
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
    
    @objc(setWaypoints:waypoints:)
    public func setWaypoints(view: Any, waypoints: [MapboxWaypoint]) {
        guard let currentView = view as? MapboxNavigationView else {
            return
        }
        currentView.setWaypoints(waypoints: waypoints)
    }
    
    @objc(recenter:)
    public func recenter(_ reactTag: NSNumber) {
        DispatchQueue.main.async {
            if let navigationView = self.bridge.uiManager.view(forReactTag: reactTag) as? MapboxNavigationView {
                navigationView.recenter()
            }
        }
    }
}
