//
//  FindPWViewController.swift
//  Clue
//
//  Created by 이정호 on 1/31/24.
//

import Foundation
import UIKit
import CommonSource

class FindPWViewController: UIViewController {
    var login = LoginManage()
    
    @IBOutlet weak var findPWLabel: UILabel!
    @IBOutlet weak var idTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var findBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func touchBtn(_ sender: Any) {
        let id: String? = idTxt.text!
        let email: String? = emailTxt.text!
        var pwFound: Int = -1
        
        guard let jsonData = login.load(),
              let userList = try? JSONDecoder().decode(UserList.self, from: jsonData)
        else { print("Fail"); return }
        
        for i in 0..<userList.totalCount {
            if userList.users[i].id == id && userList.users[i].email == email {
                pwFound = i
            }
        }
        
        print(pwFound)
        
        if pwFound != -1 {
            let found = UIAlertController(title: "PW Found", message: "Your PW is " + userList.users[pwFound].pw, preferredStyle: .alert)
            found.addAction(UIAlertAction(title: "Confirm", style: .default, handler: nil))
            present(found, animated: true)
        } else {
            let found = UIAlertController(title: "PW not found", message: "Please try again", preferredStyle: .alert)
            found.addAction(UIAlertAction(title: "Confirm", style: .destructive, handler: nil))
            present(found, animated: true)
        }
    }
}
