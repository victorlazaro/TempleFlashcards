//
//  TempleTableViewCell.swift
//  TempleFlashcards
//
//  Created by Victor Lazaro on 10/9/17.
//  Copyright © 2017 Victor Lazaro. All rights reserved.
//

import UIKit

class TempleTableViewCell: UITableViewCell {

    
    @IBOutlet weak var templeName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
