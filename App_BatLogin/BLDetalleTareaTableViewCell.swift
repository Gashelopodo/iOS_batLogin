//
//  BLDetalleTareaTableViewCell.swift
//  App_BatLogin
//
//  Created by cice on 10/2/17.
//  Copyright © 2017 cice. All rights reserved.
//

import UIKit

class BLDetalleTareaTableViewCell: UITableViewCell {
    
    
    //MARK: - Outlet
    
    @IBOutlet weak var myImagenTarea: UIImageView!
    @IBOutlet weak var myIconoTarea: UIImageView!
    @IBOutlet weak var myDescripcionTarea: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
