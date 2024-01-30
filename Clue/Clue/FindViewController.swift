//
//  FindViewController.swift
//  Clue
//
//  Created by 김선호 on 1/27/24.
//

import UIKit
import CommonSource

class FindViewController: UIViewController {
    
    var temp = LoginManage()
    
    
    @IBOutlet weak var findLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var notifyLabel: UILabel!
    
    
    @IBAction func findButton(_ sender: Any) {
    }
    
    @IBAction func findpwButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        temp.temp()

 
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
