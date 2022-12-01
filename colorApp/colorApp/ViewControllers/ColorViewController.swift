//  ColorViewController.swift
//  ColorApp
//  Created by Carolina on 30.11.22.

import UIKit

final class ColorViewController: UIViewController {
    var color: Color?
    var delegate: ChangeColor?
    var colorMain: UIView?
    // MARK: - IBOutlets
    ///red
    @IBOutlet private weak var redSlider: UISlider!
    @IBOutlet weak var redTF: UITextField!
    ///green
    @IBOutlet private weak var greenSlider: UISlider!
    @IBOutlet weak var greenTF: UITextField!
    ///blue
    @IBOutlet private weak var blueSlider: UISlider!
    @IBOutlet weak var blueTF: UITextField!
    ///opacity
    @IBOutlet weak var opacityTF: UITextField!
    @IBOutlet private weak var opacitySlider: UISlider!
    
    @IBOutlet private weak var colorView: UIView!
    @IBOutlet private weak var doneBtn: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        color = Color(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value)
        setupUI()
    }
    
    // MARK: - Actions
    @IBAction func sliderAction(_ sender: UISlider) {
        if (sender.tag == 1) {
            color?.setRed(red: sender.value)
            redTF.text = color?.getValueRed()
            colorView.backgroundColor = color?.getColor()
        } else if (sender.tag == 2) {
            color?.setGreen(green: sender.value)
            greenTF.text = color?.getValueGreen()
            colorView.backgroundColor = color?.getColor()
        } else if (sender.tag == 3) {
            color?.setBlue(blue: sender.value)
            blueTF.text = color?.getValueBlue()
            colorView.backgroundColor = color?.getColor()
        }
        doneBtn.isEnabled = isEnabledButton()
    }
    
    @IBAction private func redTFAction() {
        if let actualNumber = Int(redTF.text ?? "" ), actualNumber >= 0 && actualNumber <= 255 {
            redSlider.value = Float(Int(actualNumber))
            color?.setRed(red: redSlider.value)
            colorView.backgroundColor = color?.getColor()
            doneBtn.isEnabled = isEnabledButton()
        } else {
            showAlert(title: "Wrong format!", message: "Please enter a value from 0 to 255")
        }
    }
    
    @IBAction func greenTFAction() {
        if let actualNumber = Int(greenTF.text ?? "" ), actualNumber >= 0 && actualNumber <= 255 {
            greenSlider.value = Float(Int(actualNumber))
            color?.setGreen(green: greenSlider.value)
            colorView.backgroundColor = color?.getColor()
            doneBtn.isEnabled = isEnabledButton()
        } else {
            showAlert(title: "Wrong format!", message: "Please enter a value from 0 to 255")
        }
    }
    
    @IBAction func blueTFAction() {
        if let actualNumber = Int(blueTF.text ?? "" ), actualNumber >= 0 && actualNumber <= 255 {
            blueSlider.value = Float(Int(actualNumber))
            color?.setBlue(blue: blueSlider.value)
            colorView.backgroundColor = color?.getColor()
            doneBtn.isEnabled = isEnabledButton()
        } else {
            showAlert(title: "Wrong format!", message: "Please enter a value from 0 to 255")
        }
    }
    
    @IBAction func opacitySliderAction() {
        let shortValue = round(Float(opacitySlider.value) * 10) / 10
        opacityTF.text = String(shortValue)
        colorView.alpha = CGFloat(shortValue)
        doneBtn.isEnabled = isEnabledButton()
    }
    @IBAction func opacityTFAction() {
        if let actualNumber = Int(opacityTF.text ?? "" ), actualNumber >= 0 && actualNumber <= 1 {
            opacitySlider.value = Float(Int(actualNumber))
            colorView.alpha = CGFloat(actualNumber)
            doneBtn.isEnabled = isEnabledButton()
        } else {
            showAlert(title: "Wrong format!", message: "Please enter a value from 0 to 1")
        }
    }
    
    // MARK: - Navigation
    @IBAction func doneAction() {
        delegate?.updateColor(color: colorView.backgroundColor)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setupUI() {
        redTF.text = color?.getValueRed()
        greenTF.text = color?.getValueGreen()
        blueTF.text = color?.getValueBlue()
        colorView.backgroundColor = color?.getColor()
        opacityTF.text = "\(opacitySlider.value)"
        if colorView.backgroundColor != colorMain?.backgroundColor {
            doneBtn.isEnabled = false
        } else {
            doneBtn.isEnabled = true
        }
    }
    
    private func isEnabledButton() -> Bool {
        if colorView.backgroundColor != colorMain?.backgroundColor {
            doneBtn.isEnabled = true
        } else {
            doneBtn.isEnabled = false
        }
        return doneBtn.isEnabled
    }
}
