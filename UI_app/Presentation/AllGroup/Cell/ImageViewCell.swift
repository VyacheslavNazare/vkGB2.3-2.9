//
//  AllGroupViewCell.swift
//  UI_app
//
//  Created by Вячеслав on 23.08.2021.
//

import UIKit

class AllGroupViewCell: UITableViewCell {

    @IBOutlet var circleView: CircleView!
    @IBOutlet var groupNameLabel: UILabel!
   
    static let identifier = "AllGroupViewCell"

    
    
    func configure(group: GroupSearchDB) {
        circleView.setImageLoad(group.photo200)
        groupNameLabel.text = group.name
    }
    
}
