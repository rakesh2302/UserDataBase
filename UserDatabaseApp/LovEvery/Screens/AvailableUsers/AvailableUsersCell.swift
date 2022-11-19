//
//  AvailableUsersCell.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/23/22.
//

import UIKit

class AvailableUsersCell: UITableViewCell {

    // MARK: IBOutlet Properties

    @IBOutlet weak var subject: UILabel!
    @IBOutlet weak var message: UILabel!

    // MARK: Static Properties

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension AvailableUsersCell {

    // MARK: Function

     func setup(user: User) {
        subject.text = user.subject
        message.text = user.message
    }
    
    func setupAccessibilityIdentifier() {
        subject.accessibilityIdentifier = AccessibilityIdentifiers.AvailableUsersCell.subjectLabel
        message.accessibilityIdentifier = AccessibilityIdentifiers.AvailableUsersCell.messageLabel
    }
}
