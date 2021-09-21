//
//  TableViewCell.swift
//  JasonPratice
//
//  Created by Carlon Rosales on 8/12/21.
//

import UIKit

class TableViewCell: UITableViewCell {
    

    @IBOutlet weak var movImage: UIImageView!
    
    @IBOutlet weak var movGenre: UILabel!
    @IBOutlet weak var movYear: UILabel!
    @IBOutlet weak var movName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
