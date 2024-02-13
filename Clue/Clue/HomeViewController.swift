//
//  HomeViewController.swift
//  Clue
//
//  Created by 김선호 on 1/31/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var roomView: UIView!
    @IBOutlet weak var commuityView: UIView!
    @IBAction func switchView(_ sender:UISegmentedControl){
        if sender.selectedSegmentIndex == 0{
            roomView.alpha = 1
            commuityView.alpha = 0
        }
        else if sender.selectedSegmentIndex == 1{
            roomView.alpha = 0
            commuityView.alpha = 1
          
        }
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            roomView.alpha = 1
            commuityView.alpha = 0
        }
        
        
        // Do any additional setup after loading the view.
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
