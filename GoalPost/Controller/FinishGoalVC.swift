//
//  FinishGoalVC.swift
//  GoalPost
//
//  Created by Анастасия on 12.08.2020.
//  Copyright © 2020 Anastasia. All rights reserved.
//

import UIKit
import CoreData

class DataManager {
        static let shared = DataManager()
        var firstVC = GoalsVC()
}

class FinishGoalVC: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var pointsTextField: UITextField!
    @IBOutlet weak var createGoalBtn: UIButton!

    var goalDescription: String!
    var goalType: GoalType!

    func initData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pointsTextField.delegate = self
    }
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        
    }
    
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        if pointsTextField.text != "" {
            self.save { (complete) in
                if complete {
                    DataManager.shared.firstVC.viewWillAppear(true)
                    self.view.window?.rootViewController?.dismiss(animated: false, completion: nil)
                }
            }
        }
    }
    
    func save(completion: (_ finished: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue
        goal.goalCompletionValue = Int32(pointsTextField.text!)!
        goal.goalProgress = Int32(0)
        
        do {
            try managedContext.save()
            completion(true)
            print("Saved")
        } catch {
            debugPrint("Could not save: \(error.localizedDescription)")
            completion(false)
        }
    }
}
