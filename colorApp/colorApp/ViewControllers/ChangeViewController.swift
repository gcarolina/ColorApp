//
//  ChangeViewController.swift
//  ColorApp
//
//  Created by Carolina on 30.11.22.
//

import UIKit

final class ChangeViewController: UIViewController {
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Navigation
    // переход от ChangeVC к ColorVC
    @IBAction private func changeBackAction() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let colorVC = storyboard.instantiateViewController(withIdentifier: "ColorViewController") as? ColorViewController {
                navigationController?.pushViewController(colorVC, animated: true)
        }
    }
    @IBAction private func unwindToChange(_ unwindSegue: UIStoryboardSegue) {
    }
   
}
