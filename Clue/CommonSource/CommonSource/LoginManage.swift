//
//  LoginManage.swift
//  CommonSource
//
//  Created by 김선호 on 1/30/24.
//

import Foundation
import UIKit

public struct UserList: Codable {
    public let totalCount: Int
    public let users: [User]
}

public struct User: Codable {
    public let id: String
    public let pw: String
    public let email: String
}

open class LoginManage{
    public init(){
        
    }
    
    @objc open func detectingLoginInput(_textField: UITextField,_label: UILabel,regularExpressionPattern: String,warningText: String){ //this function can detect user's login input.if user write wrong input,each input bar will change to red background and alert them to rewrite.
        //let regularExpressionPattern = "^[a-zA-Z0-9]*$" //only alphabet,digits available
        let isWriteInput = _textField.text?.range(of: regularExpressionPattern, options: .regularExpression ) != nil
        if isWriteInput == false {
            _textField.layer.borderColor = UIColor.systemRed.cgColor
            _textField.layer.cornerRadius = 5
            _textField.layer.borderWidth = 3
            _label.textColor = .red
            _label.text = warningText
        }
        else{
            _textField.layer.borderColor = UIColor.systemGray2.cgColor
            _textField.layer.cornerRadius = 0
            _textField.layer.borderWidth = 0
            _label.text = nil
        }
    }
    
    open func load() -> Data? {
        guard let fileLocation = Bundle.main.url(forResource: "temp", withExtension: "json") else { print("Fail Load"); return nil }
            
        do {
            let data = try Data(contentsOf: fileLocation)
            return data
        } catch {
            print("Fail Data")
            return nil
        }
    }
}
