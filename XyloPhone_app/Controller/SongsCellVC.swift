//
//  SongsCellVC.swift
//  XyloPhone_app
//
//  Created by AYTAÇ BULANIK on 3.04.2022.
//

import UIKit

class SongsCellVC: UITableViewCell {

    @IBOutlet weak var songCreateTimeLabel: UILabel!
    @IBOutlet weak var songTimeLabel: UILabel!
    @IBOutlet weak var songDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
