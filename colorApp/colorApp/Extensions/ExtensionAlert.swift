import UIKit
extension ColorViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.redTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
