//
//  CreateRoomViewController.swift
//  Clue
//
//  Created by 김선호 on 2/1/24.
//

import UIKit
import CommonSource

class CreateRoomViewController: UIViewController{
    
    var roomInPutMethod = LoginManage()
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var roomNameTF: UITextField!
    @IBOutlet weak var roomPWTF: UITextField!
    @IBOutlet weak var numButton: UIButton!
    @IBOutlet weak var typeButton: UIButton!
    @IBOutlet weak var notifyLabel: UILabel!
    let three = UIAction(title: "3",handler:{_ in print("3")})
    let four = UIAction(title: "4",handler:{_ in print("4")})
    let five = UIAction(title: "5",handler:{_ in print("5")})
    let six = UIAction(title: "6",handler:{_ in print("6")})
    let typePrivate = UIAction(title: "Private",handler:{_ in print("Private")})
    let typePublic = UIAction(title: "Public",handler:{_ in print("Public")})
    @objc func roomNameHandler(_ textField: UITextField){
        var pattern: String
        var warning: String
        let label = notifyLabel
        if textField == roomNameTF{
            pattern = "^[a-zA-Z0-9]*$"
            warning = "Please enter only letters and numbers."
        }
        else if textField == roomPWTF{
            pattern = "^\\d{4}$"
            warning = "Please enter only 4-digit number."
        }
        else{
            return
        }
            roomInPutMethod.detectingLoginInput(_textField: textField, _label: label!, regularExpressionPattern: pattern, warningText: warning)
    }
    func tempPlayer(){
        appDelegate.roomCount = 1
        appDelegate.count.append(3)
        appDelegate.roomPW.append(1111)
        appDelegate.roomName.append("temp")
        appDelegate.roomType.append("Private")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempPlayer()
        let numButtonMenu = UIMenu(title:"Select number",children: [three,four,five,six])
        let typeButtonMenu = UIMenu(title:"Selct type",children: [typePrivate,typePublic])
        numButton.menu = numButtonMenu
        typeButton.menu = typeButtonMenu
        self.roomNameTF.addTarget(self, action: #selector(roomNameHandler(_:)), for:.editingChanged)
        self.roomPWTF.addTarget(self, action: #selector(roomNameHandler(_:)), for:.editingChanged)
    }

    
    @IBAction func createRoomButton(_ sender: Any) {
        if roomNameTF.text?.isEmpty == false && roomPWTF.text?.isEmpty == false{
            appDelegate.roomCount += 1
            let intPW = Int(roomPWTF.text!)
            if let playerCount = numButton.title(for: .normal){
                let intCount = Int(playerCount)
                appDelegate.count.append(intCount!)
            }
            if let roomType = typeButton.title(for: .normal){
                appDelegate.roomType.append(roomType)
            }
            appDelegate.roomName.append(roomNameTF.text!)
            appDelegate.roomPW.append(intPW!)
        }
        else {
            let failed = UIAlertController(title: "Create room", message: "Failed", preferredStyle: .alert)
            failed.addAction(UIAlertAction(title: "확인", style: .cancel, handler: nil))
            present(failed, animated: true)
        }
        
    }
}
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

