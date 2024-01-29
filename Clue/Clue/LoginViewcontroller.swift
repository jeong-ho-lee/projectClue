//
//  LoginViewController.swift
//  Clue
//
//  Created by 김선호 on 1/25/24.
//
import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    struct UserList: Codable {
        let totalCount: Int
        let users: [User]
    }

    struct User: Codable {
        let id: String
        let pw: String
    }
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var idTextfield: UITextField!
    @IBOutlet weak var pwTextfield: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    func load() -> Data? {
        guard let fileLocation = Bundle.main.url(forResource: "temp", withExtension: "json") else { return nil }
            
        do {
            let data = try Data(contentsOf: fileLocation)
            return data
        } catch {
            return nil
        }
    }
    
    func goToHomeVC(_ sender: UIAlertAction) {
        let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")

        self.navigationController?.pushViewController(homeVC!, animated: true)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        var loginFailed: Bool = true
        var id: String? = idTextfield.text!
        var pw: String? = pwTextfield.text!
        
        guard
            let jsonData = load(),
            let userList = try? JSONDecoder().decode(UserList.self, from: jsonData)
        else { return }
        
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
        
    @objc private func detectingLoginInput(_textField: UITextField){ //this function can detect user's login input.if user write wrong input,each input bar will change to red background and alert them to rewrite.
        let regularExpressionPattern = "^[a-zA-Z0-9]*$" //only alphabet,digits available
        var isWriteInput = _textField.text?.range(of: regularExpressionPattern, options: .regularExpression ) != nil
        print(_textField.layer.cornerRadius + _textField.layer.borderWidth)
        if isWriteInput == false {
            _textField.layer.borderColor = UIColor.systemRed.cgColor
            _textField.layer.cornerRadius = 5
            _textField.layer.borderWidth = 3
            errorMessageLabel.textColor = .red
            errorMessageLabel.text = "Please enter only English and numbers"
        }
        else{
            _textField.layer.borderColor = UIColor.systemGray2.cgColor
            _textField.layer.cornerRadius = 0
            _textField.layer.borderWidth = 0
            errorMessageLabel.text = nil
       
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.idTextfield.addTarget(self, action: #selector(self.detectingLoginInput(_textField:)), for: .editingChanged)
        self.pwTextfield.addTarget(self, action: #selector(self.detectingLoginInput(_textField:)), for: .editingChanged)
    }
}
