//
//  ViewController.swift
//  maroschupkina_1PW2
//
//  Created by Marina Roshchupkina on 22.09.2021.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    private let settingsView = UIStackView()
    let setView = UIView()
    private let locationTextView = UITextView()
    private let locationManager = CLLocationManager()
    //let vview = toggleView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(vview)
        setupLocationTextView()
        setupSettingsView()
        setupSettingsButton()
        setupLocationToggle()
        setupSliders()
        //vview.setuptoggleView()
        locationManager.requestAlwaysAuthorization()
        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupSettingsButton() {
        let settingsButton = UIButton(type: .system)
        view.addSubview(settingsButton)
        
        let image = UIImage(named: "settings")!.withRenderingMode(.alwaysOriginal)
        let newimage = image.withTintColor(UIColor.gray);
        settingsButton.setImage(newimage, for: .normal)
        
        settingsButton.translatesAutoresizingMaskIntoConstraints = false
        settingsButton.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 15
        ).isActive = true
        settingsButton.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -15 ).isActive = true
        settingsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        settingsButton.widthAnchor.constraint(equalTo:
                                                settingsButton.heightAnchor).isActive = true
        
        settingsButton.addTarget(self, action: #selector(settingsButtonPressed),
                                 for: .touchUpInside)
        
    }
    private func setupSettingsView() {
        view.addSubview(setView)
        setView.translatesAutoresizingMaskIntoConstraints = false
        setView.backgroundColor = .white
        setView.alpha = 0
        setView.layer.cornerRadius = 20
        
        setView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 10
        ).isActive = true
        setView.trailingAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.trailingAnchor,
            constant: -10 ).isActive = true
        setView.heightAnchor.constraint(equalToConstant: 300).isActive =
            true
        setView.widthAnchor.constraint(
            equalTo: setView.heightAnchor,
            multiplier: 2/3
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
        //settingsView.alpha = 0
    }
    
    private var buttonCount = 0
    @objc
    private func settingsButtonPressed() {
        switch buttonCount {
        case 0, 1:
            UIView.animate(withDuration: 0.001, animations: {
                self.setView.alpha = 1 - self.setView.alpha
            })
            
        case 2:
            navigationController?.pushViewController(
                SettingsViewController(),
                animated: true
            )
        case 3:
            present(SettingsViewController(),animated: true,completion: nil)
        default:
            buttonCount = -1
        }
        buttonCount += 1
    }
    
    
    private func setupLocationTextView() {
        view.addSubview(locationTextView)
        locationTextView.backgroundColor = .white
        locationTextView.layer.cornerRadius = 20
        locationTextView.translatesAutoresizingMaskIntoConstraints = false
        locationTextView.topAnchor.constraint(
            equalTo: view.safeAreaLayoutGuide.topAnchor,
            constant: 60
        ).isActive = true
        locationTextView.centerXAnchor.constraint(
            equalTo: view.centerXAnchor
        ).isActive = true
        locationTextView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        locationTextView.leadingAnchor.constraint(
            equalTo: view.leadingAnchor,
            constant: 15
        ).isActive = true
        locationTextView.isUserInteractionEnabled = false
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
    }
    
    
    
    private let sliders = [UISlider(), UISlider(), UISlider()]
    private let colors = ["Red", "Green", "Blue"]
    //private let colors = ["Red","Blue"]
    /*private func setupSliders() {
       /* let slView = slidersStackView(frame: CGRect.zero, numberOfSliders: 3, labels: colors)
        settingsView.addArrangedSubview(slView)
        let red: CGFloat = CGFloat(slView.slidersValues[0])
        let green: CGFloat = CGFloat(slView.slidersValues[0])
        let blue: CGFloat = CGFloat(slView.slidersValues[0])
        view.backgroundColor = UIColor(red: red, green: green, blue:
           */                             blue, alpha: 1)
        
    }*/
    
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
            
            //let sldrVw = sliderView(frame: CGRect.zero, sliderLabel: colors[i])
            //view.addSubview(sldrVw)
            /*
            let label = UILabel()
            view.addSubview(label)
            label.text = colors[i]
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: 5
            ).isActive = true
            label.leadingAnchor.constraint(
                equalTo: view.leadingAnchor
            ).isActive = true
            label.widthAnchor.constraint(
                equalToConstant: 50
            ).isActive = true
            let slider = sliders[i]
            slider.translatesAutoresizingMaskIntoConstraints = false
            slider.minimumValue = 0
            slider.maximumValue = 1
            slider.addTarget(self, action:
                                #selector(sliderChangedValue), for: .valueChanged)
            view.addSubview(slider)
            slider.topAnchor.constraint(equalTo: view.topAnchor,
                                        constant: 5).isActive = true
            slider.heightAnchor.constraint(equalToConstant: 20).isActive
                = true
            slider.leadingAnchor.constraint(equalTo:
                                                label.trailingAnchor, constant: 10).isActive = true
            slider.trailingAnchor.constraint(equalTo:
                                                view.trailingAnchor).isActive = true
            slider.alpha = 1*/
        }
    }
    
    @objc private func sliderChangedValue() {
        let mysliders = settingsView.subviews.compactMap{$0 as? sliderView}
        //mysliders[0].sliderValue
        let red: CGFloat = CGFloat(mysliders[0].sliderValue)
        let green: CGFloat = CGFloat(mysliders[1].sliderValue)
        let blue: CGFloat = CGFloat(mysliders[2].sliderValue)
        view.backgroundColor = UIColor(red: red, green: green, blue:
                                        blue, alpha: 1)
    }
}

