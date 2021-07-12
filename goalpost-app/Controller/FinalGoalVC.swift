//
//  FinalGoalVC.swift
//  goalpost-app
//
//  Created by Shivansh Sinha on 12/07/21.
//

import UIKit

class FinalGoalVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!
    
    var goalDescription: String!
    var goalType: GoalType!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalBtn.bindToKeyboard()
        pointsTextField.delegate = self
    }
    
    func initData(description : String, goalType : GoalType)
    {
        self.goalDescription = description
        self.goalType = goalType
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        
    }
}
