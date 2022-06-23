//
//  DetailViewCell.swift
//  SimpleJsonParser
//
//  Created by Alex Krzywicki on 23.06.2022.
//

import UIKit

class DetailViewCell: UITableViewCell {

    @IBOutlet weak var objectLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
