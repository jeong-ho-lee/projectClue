//
//  FindViewController.swift
//  Clue
//
//  Created by 김선호 on 1/27/24.
//

import UIKit
import CommonSource

class FindViewController: UIViewController {
    var loginMethod = LoginManage()
    @IBOutlet weak var findLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var notifyLabel: UILabel!
    
    
    @IBAction func findButton(_ sender: Any) {
    }
    
    @IBAction func findpwButton(_ sender: Any) {
    }
    @objc func emailEditingChangedHandler(_ textField: UITextField) {
        let label = notifyLabel
        let pattern = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let warning = "Please enter correct email form."
        loginMethod.detectingLoginInput(_textField: textField, _label: label!, regularExpressionPattern: pattern, warningText: warning) //import by CommonSource
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTextField.addTarget(self, action: #selector(emailEditingChangedHandler(_:)), for: .editingDidEndOnExit)

 
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
