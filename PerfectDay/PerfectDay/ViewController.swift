//
//  ViewController.swift
//  PerfectDay
//
//  Created by Mary Y. Liu  on 10/6/17.
//  Copyright © 2017 Mary Y. Liu . All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces



class ViewController: UIViewController {

    
    var locationManager = CLLocationManager()
    var didFindMyLocation = false
    

    @IBAction func autocompleteClicked(_ sender: UIBarButtonItem) {
        let autocompleteController = GMSAutocompleteViewController()
        autocompleteController.delegate = self
        present(autocompleteController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var autocomplete: UINavigationItem!
    @IBOutlet weak var googleMapsContainer: UIView!
    var googleMapsView: GMSMapView!
    var resultsViewController: GMSAutocompleteResultsViewController?
    var searchController: UISearchController?
    var resultView: UITextView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let camera = GMSCameraPosition.camera(withLatitude: 37.773972, longitude: -122.431297, zoom: 12)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true;
        mapView.settings.compassButton = true
        
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        self.view = mapView

        
        if let mylocation = mapView.myLocation {
            print("User's location: \(mylocation)")
        } else {
            print("User's location is unknown")
        }
        
        let mapInsets = UIEdgeInsets(top: 100.0, left: 0.0, bottom: 0.0, right: 300.0)
        mapView.padding = mapInsets
        
        /**resultsViewController = GMSAutocompleteResultsViewController()
        resultsViewController?.delegate = self
        
        searchController = UISearchController(searchResultsController: resultsViewController)
        searchController?.searchResultUpdater = resultsViewController
        
        subView.addSubview((searchController?.searchBar)!)
        view.addSubview(subView)
        searchController?.searchBar.sizeToFit()
        searchController?.hidesNavigationBarDuringPresentation = false
        
        // When UISearchController presents the results view, present it in
        // this view controller, not one further up the chain.
        definesPresentationContext = true**/
        

        // Do any additional setup after loading the view, typically from a nib.
    }
    
    /**override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.googleMapsView = GMSMapView(frame: self.googleMapsContainer.frame)
        self.view.addSubview(googleMapsView)
    }**/
    
    func placeAutocomplete() {
        let filter = GMSAutocompleteFilter()
        filter.type = .establishment
        /**placesClient.autocompleteQuery("Sydney Oper", bounds: nil, filter: filter, callback: {(results, error) -> Void in
            if let error = error {
                print("Autocomplete error \(error)")
                return
            }
            if let results = results {
                for result in results {
                    print("Result \(result.attributedFullText) with placeID \(result.placeID)")
                }
            }
        })**/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}



extension ViewController: GMSAutocompleteViewControllerDelegate {

    
    
    // Handle the user's selection.
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        
        var street_number: String
        var route: String
        var neighborhood: String
        var locality: String
        var administrative_area_level_1: String
        var country: String
        var postal_code: String
        var postal_code_suffix: String

        print("Place name: \(place.name)")
        print("Place address: \(String(describing: place.formattedAddress))")
        print("Place attributions: \(String(describing: place.attributions))")
        
        // Get the address components.
        if let addressLines = place.addressComponents {
            // Populate all of the address fields we can find.
            for field in addressLines {
                switch field.type {
                case kGMSPlaceTypeStreetNumber:
                    street_number = field.name
                case kGMSPlaceTypeRoute:
                    route = field.name
                case kGMSPlaceTypeNeighborhood:
                    neighborhood = field.name
                case kGMSPlaceTypeLocality:
                    locality = field.name
                case kGMSPlaceTypeAdministrativeAreaLevel1:
                    administrative_area_level_1 = field.name
                case kGMSPlaceTypeCountry:
                    country = field.name
                case kGMSPlaceTypePostalCode:
                    postal_code = field.name
                case kGMSPlaceTypePostalCodeSuffix:
                    postal_code_suffix = field.name
                // Print the items we aren't using.
                default:
                    print("Type: \(field.type), Name: \(field.name)")
                }
            }
        }
        
        // Call custom function to populate the address form.
        /**fillAddressForm()
        
        func fillAddressForm() {
            address_line_1.text = street_number + " " + route
            city.text = locality
            state.text = administrative_area_level_1
            if postal_code_suffix != "" {
                postal_code_field.text = postal_code + "-" + postal_code_suffix
            } else {
                postal_code_field.text = postal_code
            }
            country_field.text = country
            
            // Clear values for next time.
            street_number = ""
            route = ""
            neighborhood = ""
            locality = ""
            administrative_area_level_1  = ""
            country = ""
            postal_code = ""
            postal_code_suffix = ""
        }
        
        // Close the autocomplete widget.
        self.dismiss(animated: true, completion: nil)**/
    }
    

    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        // TODO: handle the error.
        print("Error: \(error)")
        dismiss(animated: true, completion: nil)
    }
    
    // User cancelled the operation.
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        print("Autocomplete was cancelled.")
        dismiss(animated: true, completion: nil)
    }
}




