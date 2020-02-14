//
//  ResultTableViewCell.swift
//  SingelPhotoApp
//
//  Created by Hakim Laoukili on 2020-02-13.
//  Copyright © 2020 Hakim Laoukili. All rights reserved.
//
import Foundation
import UIKit

class ResultTableViewCell: UITableViewCell {
    
     
    @IBOutlet weak var labelCorrect: UILabel!
    
   // var delegate : ResultViewController
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
