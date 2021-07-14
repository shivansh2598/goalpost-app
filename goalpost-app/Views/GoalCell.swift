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
    @IBOutlet weak var finishTaskDisplay : UIView!
    
    func configureCell(goal : Goal){
        self.goalDescritionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            finishTaskDisplay.isHidden = false
        } else {
            finishTaskDisplay.isHidden = true
        }
    }
}

