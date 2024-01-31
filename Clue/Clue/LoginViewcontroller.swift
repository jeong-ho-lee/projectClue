//
//  LoginViewController.swift
//  Clue
//
//  Created by 김선호 on 1/25/24.
//
import Foundation
import UIKit
import CommonSource

class LoginViewController: UIViewController {
    
    var loginMethod = LoginManage()
<<<<<<< HEAD
    
=======
    struct UserList: Codable {
        let totalCount: Int
        let users: [User]
    }

    struct User: Codable {
        let id: String
        let pw: String
    }

>>>>>>> c1a51d0b03239726fc349a63f504a4f1c24bdf34
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var idTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    @IBAction func loginButton(_ sender: Any) {
        var loginFailed: Bool = true
        var id: String? = idTextfield.text!
        var pw: String? = pwTextfield.text!
        
        guard
            let jsonData = loginMethod.load(),
            let userList = try? JSONDecoder().decode(UserList.self, from: jsonData)
        else { print("Fail Again"); return }
        
        for i in 0..<userList.totalCount{
            if userList.users[i].id == id && userList.users[i].pw == pw{
                loginFailed = false
            }
        }
        
        if loginFailed {
            let failed = UIAlertController(title: "Login", message: "Failed", preferredStyle: .alert)
            failed.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            present(failed, animated: true)
        }
    }
    
    @IBAction func findButton(_ sender: Any) {
        
    }
    
    @IBAction func signupButton(_ sender: Any) {
        
    }
    
    @objc func loginEditingChangedHandler(_ textField: UITextField) {
        let label = errorMessageLabel
        let pattern = "^[a-zA-Z0-9]*$"
        let warning = "Please enter only letters and numbers."
        loginMethod.detectingLoginInput(_textField: textField, _label: label!, regularExpressionPattern: pattern, warningText: warning) //import by CommonSource
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idTextfield.addTarget(self, action: #selector(loginEditingChangedHandler(_:)), for: .editingChanged)
        self.pwTextfield.addTarget(self, action: #selector(loginEditingChangedHandler(_:)), for: .editingChanged)
    }
}
