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
        if(pointsTextField.text != "") {
            self.save { (complete) in
                if complete {
                    dismiss(animated: true, completion: nil)
                } else {
                    
                }
            }
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        pointsTextField.text = ""
    }
    
    func save(completion: (_ finished : Bool) -> ()){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            print(goal)
            completion(true)
        } catch {
            debugPrint("\(error.localizedDescription)")
            completion(false)
        }
    }
}
