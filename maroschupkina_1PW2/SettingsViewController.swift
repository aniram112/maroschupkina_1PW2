//
//  SettingsViewController.swift
//  maroschupkina_1PW2
//
//  Created by Marina Roshchupkina on 23.09.2021.
//

import UIKit
import CoreLocation

final class SettingsViewController: UIViewController {
    
    private let settingsView = UIStackView()
    let setView = UIView()
    private var locationTextView = UITextView()
    private let locationManager = CLLocationManager()
    
    convenience init(textview: UITextView){
        self.init()
        view.alpha = 1
        locationTextView = textview
    }
    override func viewDidLoad() {
        setupSettingsView()
        //setupCloseButton()
        setupLocationToggle()
        setupSliders()
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()
    }
    
    private func setupSettingsView() {
        view.addSubview(setView)
        setView.translatesAutoresizingMaskIntoConstraints = false
        setView.backgroundColor = .white
        setView.alpha = 1
        setView.layer.cornerRadius = 20
        
        setView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 20
        ).isActive = true
        setView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -10 ).isActive = false
        setView.heightAnchor.constraint(equalToConstant: 300).isActive =
            true
        setView.widthAnchor.constraint(
            equalTo: view.heightAnchor
        ).isActive = true
        
        setView.addSubview(settingsView)
        settingsView.axis = .vertical
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        settingsView.topAnchor.constraint(equalTo:
                                            setView.topAnchor).isActive = true
        settingsView.trailingAnchor.constraint(equalTo:
                                                setView.trailingAnchor).isActive = true
        settingsView.leadingAnchor.constraint(equalTo:
                                                setView.leadingAnchor).isActive = true
        setView.alpha = 1
        settingsView.alpha = 1
        view.alpha = 1
    }

    
    private func setupCloseButton() {
        let button = UIButton(type: .close)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.trailingAnchor.constraint(
            equalTo: view.trailingAnchor,
            constant: -10 ).isActive = true
        button.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 10
        ).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive =
            true
        button.widthAnchor.constraint(equalTo:
                                        button.heightAnchor).isActive = true
        button.addTarget(self, action: #selector(closeScreen),
                         for: .touchUpInside)
    }
    @objc
    private func closeScreen(){
        dismiss(animated: true, completion: nil)
    }
     
    private func setupLocationToggle(){
        let toggleview = toggleView(frame: CGRect.zero,  textview: locationTextView)
        
        settingsView.addArrangedSubview(toggleview)
        
        toggleview.translatesAutoresizingMaskIntoConstraints = false
        toggleview.leadingAnchor.constraint(
            equalTo: settingsView.leadingAnchor,
            constant: 10
        ).isActive = true
        toggleview.trailingAnchor.constraint(
            equalTo: settingsView.trailingAnchor,
            constant: -10 ).isActive = true
        toggleview.topAnchor.constraint(
            equalTo: settingsView.topAnchor,
            constant: 10
        ).isActive = true
        toggleview.heightAnchor.constraint(equalToConstant: 60).isActive =
            true
        toggleview.alpha = 1
    }
    
    private let sliders = [UISlider(), UISlider(), UISlider()]
    private let colors = ["Red", "Green", "Blue"]
    private var slidersVariables = Array(repeating: CGFloat(0), count: 3)
    
    private func setupSliders() {
        var top = 80
        for i in 0..<sliders.count {
            let view = sliderView(frame: CGRect.zero, sliderLabel: colors[i])
            //view.backgroundColor = .yellow
            
            settingsView.addArrangedSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.leadingAnchor.constraint(
                equalTo: settingsView.leadingAnchor,
                constant: 10
            ).isActive = true
            view.trailingAnchor.constraint(
                equalTo: settingsView.trailingAnchor,
                constant: -10 ).isActive = true
            view.topAnchor.constraint(
                equalTo: settingsView.topAnchor,
                constant: CGFloat(top)
            ).isActive = true
            view.heightAnchor.constraint(equalToConstant: 40).isActive =
                true
            top += 40
            
            view.slider.addTarget(self, action:
                                #selector(sliderChangedValue), for: .valueChanged)
            
        }
        
        
    }
    
    @objc private func sliderChangedValue() {
        let mysliders = settingsView.subviews.compactMap{$0 as? sliderView}
        //mysliders[0].sliderValue
        let red: CGFloat = CGFloat(mysliders[0].sliderValue)
        let green: CGFloat = CGFloat(mysliders[1].sliderValue)
        let blue: CGFloat = CGFloat(mysliders[2].sliderValue)
        Settings.sharedInstance.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        self.view.backgroundColor = Settings.sharedInstance.backgroundColor
    }
    
    
    
}

extension SettingsViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        guard let coord: CLLocationCoordinate2D =
                manager.location?.coordinate else { return }
        locationTextView.text = "Coordinates = \(coord.latitude) \(coord.longitude)"
    }
}


