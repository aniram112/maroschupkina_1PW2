//
//  sliderView.swift
//  maroschupkina_1PW2
//
//  Created by Marina Roshchupkina on 28.09.2021.
//

import UIKit
class sliderView: UIView{
    let slider : UISlider
    let sliderlabel : String
    var  sliderValue : CGFloat
    //private let slidersStackView : UIStackView
    
    required init(frame: CGRect, sliderLabel: String) {
        slider = UISlider()
        sliderlabel = sliderLabel
        sliderValue = 0
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        sliderlabel = "label"
        slider = UISlider()
        sliderValue = 0
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        //self.backgroundColor = .yellow
        let label = UILabel()
        self.addSubview(label)
        label.text = sliderlabel
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(
            equalTo: self.topAnchor,
            constant: 5
        ).isActive = true
        label.leadingAnchor.constraint(
            equalTo: self.leadingAnchor
        ).isActive = true
        label.widthAnchor.constraint(
            equalToConstant: 50
        ).isActive = true
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.addTarget(self, action:
                            #selector(sliderChangedValue), for: .valueChanged)
        self.addSubview(slider)
        slider.topAnchor.constraint(equalTo: self.topAnchor,
                                    constant: 5).isActive = true
        slider.heightAnchor.constraint(equalToConstant: 20).isActive
            = true
        slider.leadingAnchor.constraint(equalTo:
                                            label.trailingAnchor, constant: 10).isActive = true
        /*slider.trailingAnchor.constraint(equalTo:
                                            self.trailingAnchor).isActive = true*/
        slider.widthAnchor.constraint(
            equalToConstant: 100
        ).isActive = true
        slider.alpha = 1
        
       
    }
    @objc private func sliderChangedValue() {
            sliderValue = CGFloat(slider.value)
    }
}
