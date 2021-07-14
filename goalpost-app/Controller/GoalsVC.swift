//
//  GoalsVC.swift
//  goalpost-app
//
//  Created by Shivansh Sinha on 07/07/21.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as? AppDelegate

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var goals : [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchCoreData()
        tableView.reloadData()
    }
    
    func fetchCoreData(){
        self.fetch { (success) in
            if goals.count >= 1 {
                tableView.isHidden = false
            } else {
                tableView.isHidden = true
            }
        }
    }
    
    @IBAction func addGoalBtnWasPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(identifier: "CreateGoalVC") else { return }
        presentDetail(createGoalVC)
    }
    
}

extension GoalsVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else { return UITableViewCell() }
        let goal = goals[indexPath.row]
        cell.configureCell(goal : goal)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "DELETE") { (rowAction, view, completed) in
            self.removeGoal(atIndexPath: indexPath)
            self.fetchCoreData()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completed(true)
        }
        
        let incrementAction = UIContextualAction(style: .normal, title: "ADD 1") { (rowAction, view, completed) in
            self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        incrementAction.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1)
        let swipeAction = UISwipeActionsConfiguration(actions: [deleteAction, incrementAction])
        return swipeAction
    }
}


extension GoalsVC {
    
    func removeGoal(atIndexPath indexPath : IndexPath)
    {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
            print("Successfully removed goal!!")
        } catch  {
            debugPrint("Could not remove \(error.localizedDescription)")
        }
    }
    
    func fetch(_ completion : (Bool)->())
    {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<Goal>(entityName: "Goal")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            goals = try managedContext.fetch(fetchRequest)
            completion(true)
        } catch  {
            debugPrint("Fetch request failed \(error.localizedDescription)")
            completion(false)
        }
    }
    
    func setProgress(atIndexPath indexPath : IndexPath)
    {
        guard  let managedContext = appDelegate?.persistentContainer.viewContext else {
            return
        }
        
        let choosenGoal = goals[indexPath.row]
        if choosenGoal.goalProgress < choosenGoal.goalCompletionValue {
            choosenGoal.goalProgress += 1
        } else {
        }
        
        do {
            try managedContext.save()
            debugPrint("Modification done successfully!!")
        } catch  {
            debugPrint("Modification failed \(error.localizedDescription)")
        }
    }
}
