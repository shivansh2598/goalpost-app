//
//  GoalCell.swift
//  goalpost-app
//
//  Created by Shivansh Sinha on 08/07/21.
//

import UIKit

class GoalCell: UITableViewCell {
    @IBOutlet weak var goalDescritionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    
    func configureCell(description: String, type: String, goalProgressAmount: String){
        self.goalDescritionLbl.text = description
        self.goalTypeLbl.text = type
        self.goalProgressLbl.text = String(describing: goalProgressLbl)
    }
}
