//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by Shivansh Sinha on 09/07/21.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var selectedGoalType : GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextBtn.bindToKeyboard()
        shortTermBtn.setSelectedBtn()
        longTermBtn.setDeselectedBtn()
    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        selectedGoalType = .shortTerm
        shortTermBtn.setSelectedBtn()
        longTermBtn.setDeselectedBtn()
    }
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        selectedGoalType = .longTerm
        shortTermBtn.setDeselectedBtn()
        longTermBtn.setSelectedBtn()
    }
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        
    }
}
