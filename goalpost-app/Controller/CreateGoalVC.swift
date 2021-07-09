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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func shortTermBtnWasPressed(_ sender: Any) {
        
    }
    @IBAction func longTermBtnWasPressed(_ sender: Any) {
        
    }
    @IBAction func nextBtnWasPressed(_ sender: Any) {
        
    }
}
