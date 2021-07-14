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
    
    func configureCell(goal : Goal){
        self.goalDescritionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
    }
}

