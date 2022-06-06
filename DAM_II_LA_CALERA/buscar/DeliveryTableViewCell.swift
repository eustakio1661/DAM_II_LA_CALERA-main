//
//  DeliveryTableViewCell.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 29/11/21.
//

import UIKit

class DeliveryTableViewCell: UITableViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
