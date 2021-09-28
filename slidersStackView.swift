//
//  sliderView.swift
//  maroschupkina_1PW2
//
//  Created by Marina Roshchupkina on 28.09.2021.
//

import UIKit
class slidersStackView: UIView{
    let sliders : Array<UISlider>
    let colors : Array<String>
    var  slidersValues : Array<CGFloat>
    private let slidersStackView : UIStackView
    
    required init(frame: CGRect, numberOfSliders: Int, labels: Array<String>) {
        sliders = Array(repeating: UISlider(), count: numberOfSliders)
        slidersValues = Array(repeating: CGFloat(0), count: numberOfSliders)
        colors = labels
        slidersStackView = UIStackView()
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        sliders = Array(repeating: UISlider(), count: 0)
        slidersValues = Array(repeating: CGFloat(0), count: 0)
        colors = [" "]
        slidersStackView = UIStackView()
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        self.addSubview(slidersStackView)
        slidersStackView.axis = .vertical
        slidersStackView.translatesAutoresizingMaskIntoConstraints = false
        slidersStackView.topAnchor.constraint(equalTo:
                                            self.topAnchor).isActive = true
        slidersStackView.trailingAnchor.constraint(equalTo:
                                                self.trailingAnchor).isActive = true
        slidersStackView.leadingAnchor.constraint(equalTo:
                                                self.leadingAnchor).isActive = true
        /*
        slidersStackView.translatesAutoresizingMaskIntoConstraints = false
        slidersStackView.topAnchor.constraint(
            equalTo: self.topAnchor,
            constant: 40
        ).isActive = true
        slidersStackView.leadingAnchor.constraint(
            equalTo: self.leadingAnchor,
            constant: 5 ).isActive = true
        slidersStackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive =
            true
        slidersStackView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive =
            true
        
        slidersStackView.trailingAnchor.constraint(
            equalTo: self.trailingAnchor,
            constant: -5 ).isActive = true*/
        
        slidersStackView.backgroundColor = .magenta
        var top = 10
        
        for i in 0..<sliders.count {
            let view = UIView()
            slidersStackView.addArrangedSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
            view.leadingAnchor.constraint(
                equalTo: slidersStackView.leadingAnchor,
                constant: 10
            ).isActive = true
            view.trailingAnchor.constraint(
                equalTo: slidersStackView.trailingAnchor,
                constant: -10 ).isActive = true
            view.topAnchor.constraint(
                equalTo: slidersStackView.topAnchor,
                constant: CGFloat(top)
            ).isActive = true
            view.heightAnchor.constraint(equalToConstant: 30).isActive =
                true
            top += 40
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
            slider.alpha = 1
        }
       
    }
    @objc private func sliderChangedValue() {
        for i in 0..<sliders.count{
            slidersValues[i] = CGFloat(sliders[i].value)
        }
    }
}
