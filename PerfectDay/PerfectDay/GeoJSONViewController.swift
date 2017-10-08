//
//  File.swift
//  PerfectDay
//
//  Created by Mary Y. Liu  on 10/7/17.
//  Copyright © 2017 Mary Y. Liu . All rights reserved.
//

/**import GoogleMaps
import UIKit
import Google-Maps-iOS-Utils

class GeoJSON
    private var mapView: GMSMapView!
    private var renderer: GMUGeometryRenderer!
    private var geoJsonParser: GMUGeoJSONParser!
    
    override func loadView() {
        let camera = GMSCameraPosition.camera(withLatitude: -28, longitude: 137, zoom: 4)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.view = mapView
        
        let path = Bundle.main.path(forResource: "GeoJSON_sample", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        geoJsonParser = GMUGeoJSONParser(url: url)
        geoJsonParser.parse()
        
        renderer = GMUGeometryRenderer(map: mapView, geometries: geoJsonParser.features)
        
        renderer.render()
    }
}**/
