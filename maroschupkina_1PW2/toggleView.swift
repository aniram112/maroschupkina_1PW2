//
//  toggleView.swift
//  maroschupkina_1PW2
//
//  Created by Marina Roshchupkina on 24.09.2021.
//

import UIKit
import CoreLocation
class toggleView: UIView{
    //let locationToggle = UISwitch()
    let locationTextView : UITextView
    private let locationManager = CLLocationManager()
    
    required init(frame: CGRect, textview: UITextView ) {
        locationTextView = textview;
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        locationTextView = UITextView()
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        
        //self.backgroundColor = .red
        let locationToggle = UISwitch()
        
        self.addSubview(locationToggle)
        
        locationToggle.translatesAutoresizingMaskIntoConstraints = false
        locationToggle.topAnchor.constraint(
            equalTo: self.topAnchor,
            constant: 20
        ).isActive = true
        locationToggle.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 10 ).isActive = true
        locationToggle.addTarget(
            self,
            action: #selector(locationToggleSwitched),
            for: .valueChanged
        )
        
        let locationLabel = UILabel()
        self.addSubview(locationLabel)
        locationLabel.text = "Location"
        
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.topAnchor.constraint(
            equalTo: self.topAnchor,
            constant: 25
        ).isActive = true
        /*locationLabel.leadingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: 10
        ).isActive = true*/
       locationLabel.leadingAnchor.constraint(
            equalTo: locationToggle.trailingAnchor,
            constant: 10 ).isActive = true
        
    }
    @objc
    func locationToggleSwitched(_ sender: UISwitch) {
        if sender.isOn {
            if CLLocationManager.locationServicesEnabled() {
                locationManager.delegate = self
                locationManager.desiredAccuracy =
                    kCLLocationAccuracyNearestTenMeters
                locationManager.startUpdatingLocation()
            } else {
                sender.setOn(false, animated: true)
            }
        } else {
            locationTextView.text = ""
            locationManager.stopUpdatingLocation()
        }
    }
    
    
}
extension toggleView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let coord: CLLocationCoordinate2D =
                manager.location?.coordinate else { return }
        locationTextView.text = "Coordinates = \(coord.latitude) \(coord.longitude)"
        locationTextView.textColor = .black
    }
}
