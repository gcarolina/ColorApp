//  ColorViewController.swift
//  ColorApp
//  Created by Carolina on 30.11.22.

import UIKit

final class ColorViewController: UIViewController {
    var color: Color?
    var delegate: ChangeColor?
    var clrModel: Color?
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
    
    private var red: Int = 0 {
        didSet {
            ColorController()
            checkModels()
        }
    }
    private var green: Int = 0 {
        didSet {
            ColorController()
            checkModels()
        }
    }
    private var blue: Int = 0 {
        didSet {
            ColorController()
            checkModels()
        }
    }
    private var alpha: Int = 1 {
        didSet {
            ColorController()
            checkModels()
        }
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        setupColor()
        color = Color(red: Float(red), green: Float(green), blue: Float(blue), alpha: Float(alpha))
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
    }
    
    @IBAction func textFieldAction(_ sender: UITextField) {
        if let actualNumber = Int(sender.text ?? ""), actualNumber >= 0 && actualNumber <= 255 {
            if (sender.tag == 1) {
                redSlider.value = Float(Int(sender.text ?? "" ) ?? 0)
                color?.setRed(red: redSlider.value)
                colorView.backgroundColor = color?.getColor()
            } else if (sender.tag == 2) {
                greenSlider.value = Float(Int(sender.text ?? "" ) ?? 0)
                color?.setGreen(green: greenSlider.value)
                colorView.backgroundColor = color?.getColor()
            } else if (sender.tag == 3) {
                blueSlider.value = Float(Int(sender.text ?? "" ) ?? 0)
                color?.setBlue(blue: blueSlider.value)
                colorView.backgroundColor = color?.getColor()
            }
        } else {
            showAlert(title: "Wrong format!", message: "Please enter a value from 0 to 255")
        }
    }
    
    @IBAction func opacitySliderAction() {
        let shortValue = round(Float(opacitySlider.value) * 10) / 10
        opacityTF.text = String(shortValue)
        colorView.alpha = CGFloat(shortValue)
    }
    @IBAction func opacityTFAction() {
        if let actualNumber = Int(opacityTF.text ?? "" ), actualNumber >= 0 && actualNumber <= 1 {
            opacitySlider.value = Float(Int(actualNumber))
            colorView.alpha = CGFloat(actualNumber)
        } else {
            showAlert(title: "Wrong format!", message: "Please enter a value from 0 to 1")
        }
    }
    
    // MARK: - Navigation
    @IBAction func doneAction() {
        let colorModel = Color(red: Float(redSlider.value), green: Float(greenSlider.value), blue: Float(blueSlider.value), alpha: Float(opacitySlider.value))
        
        delegate?.updateColor(color: colorModel)
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Functions
    private func setupUI() {
        redTF.text = color?.getValueRed()
        greenTF.text = color?.getValueGreen()
        blueTF.text = color?.getValueBlue()
        colorView.backgroundColor = color?.getColor()
        opacityTF.text = "\(opacitySlider.value)"
    }
    
    private func ColorController() {
        let redCGFloat = CGFloat(Float(red) / 255)
        let greenCGFloat = CGFloat(Float(green) / 255)
        let blueCGFloat = CGFloat(Float(blue) / 255)
        let alphaCGFloat = CGFloat(Float(alpha) / 100)

        let color = UIColor(red: redCGFloat, green: greenCGFloat, blue: blueCGFloat, alpha: alphaCGFloat)
        colorView.backgroundColor = color
    }
    
    private func checkModels() {
        let newColorModel = Color(red: redSlider.value, green: greenSlider.value, blue: blueSlider.value, alpha: opacitySlider.value)
//        Color(red: Float(red), green: Float(green), blue: Float(blue), alpha: Float(alpha))
        if clrModel != newColorModel {
            doneBtn.isEnabled = true
        } else {
            doneBtn.isEnabled = false
        }
    }
    
    private func setupColor() {
        if let colorModel = clrModel {
            red = Int(colorModel.red)
            green = Int(colorModel.green)
            blue = Int(colorModel.blue)
            alpha = Int(colorModel.alpha)

            redSlider.value = Float(red)
            greenSlider.value = Float(green)
            blueSlider.value = Float(blue)
            opacitySlider.value = Float(alpha)
            
            redTF.text = String(red)
            greenTF.text = String(green)
            blueTF.text = String(blue)
            opacityTF.text = String(alpha)
        }
    }
}
