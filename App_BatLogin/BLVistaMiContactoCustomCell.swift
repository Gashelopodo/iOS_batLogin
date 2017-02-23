//
//  BLVistaMiContactoCustomCell.swift
//  App_BatLogin
//
//  Created by cice on 3/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BLVistaMiContactoCustomCell: UITableViewCell {
    
    
    //MARK: - outlet
    
    @IBOutlet weak var myFotoContacto: UIImageView!
    @IBOutlet weak var myNombreContacto: UILabel!
    @IBOutlet weak var myApellidoContacto: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
