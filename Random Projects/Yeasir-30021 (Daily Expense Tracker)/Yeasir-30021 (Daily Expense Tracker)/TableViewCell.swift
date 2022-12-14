//
//  TableViewCell.swift
//  Yeasir-30021 (Daily Expense Tracker)
//
//  Created by bjit on 14/12/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var expenseType: UILabel!
    
    @IBOutlet weak var expenseDescripTion: UILabel!
    
    
    @IBOutlet weak var expenseAmount: UILabel!
    
    
    @IBOutlet weak var expenseDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    

}
