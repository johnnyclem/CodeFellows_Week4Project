//
//  PlayerCell.swift
//  Hacker Mission
//
//  Created by Jacob Hawken on 10/27/14.
//  Copyright (c) 2014 Code Fellows. All rights reserved.
//

import UIKit

class PlayerCell: UICollectionViewCell
{
    //MARK: Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var approvesMission: UILabel!
    @IBOutlet weak var rejectsMission: UILabel!
    @IBOutlet weak var leaderStar: UILabel!
    
    var isSelected : Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  

}
