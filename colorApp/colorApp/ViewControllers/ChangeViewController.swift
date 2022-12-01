//  ChangeViewController.swift
//  ColorApp
//  Created by Carolina on 30.11.22.

import UIKit

protocol ChangeColor {
    func updateColor(color: UIColor?)
}

final class ChangeViewController: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet var mainView: UIView!
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
                navigationController?.pushViewController(colorVC, animated: true)
                colorVC.colorMain = mainView
        }
    }
}

extension ChangeViewController: ChangeColor {
    func updateColor(color: UIColor?) {
        mainView.backgroundColor = color
    }
}
