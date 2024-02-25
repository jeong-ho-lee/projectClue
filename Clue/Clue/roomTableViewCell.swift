//
//  roomTableViewCell.swift
//  Clue
//
//  Created by 김선호 on 2/8/24.
//

import UIKit

protocol cellDelegate: AnyObject{
    func joinButton()
}
class roomTableViewCell: UITableViewCell {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate 
    @IBOutlet var button: UIButton!
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
        
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
            
            // Configure the view for the selected state
        }
        
    }
