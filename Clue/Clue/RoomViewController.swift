//
//  RoomViewController.swift
//  Clue
//
//  Created by 김선호 on 1/31/24.
//

import UIKit
import CommonSource

class RoomViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.roomCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = appDelegate.roomName[indexPath.row]
        return cell
    }
    
   

    @IBOutlet weak var roomTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.roomTableView?.dataSource = self
        self.roomTableView?.delegate = self

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
