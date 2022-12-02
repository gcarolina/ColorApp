//  ChangeViewController.swift
//  ColorApp
//  Created by Carolina on 30.11.22.

import UIKit

protocol ChangeColor {
    func updateColor(color: Color)
}

final class ChangeViewController: UIViewController {
    // MARK: - IBOutlet
//    @IBOutlet var mainView: UIView!
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Navigation
    // переход от ChangeVC к ColorVC
    @IBAction private func changeBackAction() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let colorVC = storyboard.instantiateViewController(withIdentifier: "ColorViewController") as? ColorViewController {
            colorVC.delegate = self
            if let backColor = view.backgroundColor, let colorModel = getModelFromUIColor(uiColor: backColor) {
                colorVC.clrModel = colorModel
            }
            navigationController?.pushViewController(colorVC, animated: true)
        }
    }
}

extension ChangeViewController: ChangeColor {
    func updateColor(color: Color) {
        let red = CGFloat(Float(color.red) / 255)
        let green = CGFloat(Float(color.green) / 255)
        let blue = CGFloat(Float(color.blue) / 255)
        let alpha = CGFloat(color.alpha)
        let newColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        view.backgroundColor = newColor
    }
}

func getModelFromUIColor(uiColor: UIColor) -> Color? {
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 1
    
    uiColor.getRed(&red,
                   green: &green,
                   blue: &blue,
                   alpha: &alpha)
    let redInt = Int(red * 255)
    let greenInt = Int(green * 255)
    let blueInt = Int(blue * 255)
    let alphaInt = Float(alpha)
    
    let colorModel = Color(red: Float(redInt),
                           green: Float(greenInt),
                           blue: Float(blueInt),
                           alpha: alphaInt)
    return colorModel
}
