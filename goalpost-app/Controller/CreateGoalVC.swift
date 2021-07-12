//
//  CreateGoalVC.swift
//  goalpost-app
//
//  Created by Shivansh Sinha on 09/07/21.
//

import UIKit

class CreateGoalVC: UIViewController, UITextViewDelegate {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var longTermBtn: UIButton!
    @IBOutlet weak var shortTermBtn: UIButton!
    @IBOutlet weak var nextBtn: UIButton!
    
    var selectedGoalType : GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        goalTextView.delegate = self
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
        if goalTextView.text != "" && goalTextView.text != "Enter your goal.." {
            guard let finalGoalVC = storyboard?.instantiateViewController(identifier: "FinalGoalVC") as? FinalGoalVC else { return }
            finalGoalVC.initData(description: goalTextView.text!, goalType: selectedGoalType)
            presentDetail(finalGoalVC)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        goalTextView.text = ""
        goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
