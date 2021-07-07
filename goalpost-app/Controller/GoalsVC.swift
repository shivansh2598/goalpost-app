//
//  GoalsVC.swift
//  goalpost-app
//
//  Created by Shivansh Sinha on 07/07/21.
//

import UIKit

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        debugPrint("Button was pressed")
    }
    
}

