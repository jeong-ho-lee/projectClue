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
    let refreshControll : UIRefreshControl = UIRefreshControl()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appDelegate.roomCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! roomTableViewCell
        cell.textLabel?.text = appDelegate.roomName[indexPath.row]
        cell.button.addTarget(self, action: #selector(roomJoinAction), for: .touchUpInside)
        return cell
    }
    @objc func roomJoinAction(sender:UIButton){
        if let cell = sender.superview?.superview as? roomTableViewCell, let indexPath = roomTableView.indexPath(for: cell) { //추후에 반드시 이해해야할 코드
            let tmpIndex = indexPath
            var tmpPW: Int? = 0
            let alert = UIAlertController(title: "Join", message: "Please enter password", preferredStyle: .alert)
            alert.addTextField { (pwField) in
                pwField.placeholder = "Enter password"
                let join = UIAlertAction(title: "Join",style: .default){ (action) in
                    if(pwField != nil){
                        tmpPW = Int(pwField.text!)
                        if(tmpPW! == self.appDelegate.roomPW[tmpIndex.row]){
                            guard let nextVC = self.storyboard?.instantiateViewController(identifier: "InRoomView") else { return }
                            nextVC.modalPresentationStyle = .fullScreen
                            self.present(nextVC, animated: true, completion: nil)
                        }
                    }
                }
                let cancel = UIAlertAction(title: "Cancel",style: .destructive)
                alert.addAction(join)
                alert.addAction(cancel)
            }
            if(appDelegate.roomType[tmpIndex.row] == "Private"){
                present(alert, animated: true)
            }
        }
    }
    
    @objc func settingRefreshControl(){ //Add function in refreshControll
        refreshControll.addTarget(self, action: #selector(self.refreshFunction), for: .valueChanged)
    }
    
    @objc func refreshFunction(){ //refreshing function
        print("refresh")
        refreshControll.endRefreshing()
        roomTableView.reloadData()
    }
    
    @IBOutlet weak var roomTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.roomTableView?.dataSource = self
        self.roomTableView?.delegate = self
        
        roomTableView.refreshControl = refreshControll
        settingRefreshControl()
    }
}
