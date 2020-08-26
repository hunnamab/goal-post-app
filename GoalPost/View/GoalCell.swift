//
//  GoalCell.swift
//  GoalPost
//
//  Created by Анастасия on 23.07.2020.
//  Copyright © 2020 Anastasia. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var goalDescriptionLbl: UILabel!
    @IBOutlet weak var goalTypeLbl: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    func configureCell (goal: Goal) {
        self.goalDescriptionLbl.text = goal.goalDescription
        self.goalTypeLbl.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.goalProgress)
        if goal.goalProgress == goal.goalCompletionValue {
            completionView.isHidden = false
        } else {
            completionView.isHidden = true
        }
    }

}
