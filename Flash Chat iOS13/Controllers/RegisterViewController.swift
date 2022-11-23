import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    let alertController = UIAlertController(title: "Error", message: "\(e.localizedDescription)", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Ok", style: .default) { (action) in }
                    alertController.addAction(action)
                    self.present(alertController, animated: true)
                } else {
                    //                    Navigate to the chat VC
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
    }
    
}
