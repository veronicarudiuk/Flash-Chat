import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alertController = UIAlertController(title: "Error", message: "\(e.localizedDescription)", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default) { (action) in }
                    alertController.addAction(action)
                    self.present(alertController, animated: true)
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}
