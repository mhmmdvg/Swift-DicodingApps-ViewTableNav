//
//  AcademyTableViewCell.swift
//  DicodingApps
//
//  Created by Muhammad Vikri on 29/08/22.
//

import UIKit

class AcademyTableViewCell: UITableViewCell {

    @IBOutlet weak var academyLabel: UILabel!
    @IBOutlet weak var academyDesc: UILabel!
    @IBOutlet weak var academyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
