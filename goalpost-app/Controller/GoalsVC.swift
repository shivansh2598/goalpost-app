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
        tableView.dataSource = self
        tableView.delegate = self
    }

    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        debugPrint("Button was pressed")
    }
    
}

extension GoalsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
        cell.configureCell(description: "Eat salad twice a week", type: "Short Term", goalProgressAmount: 2)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}

