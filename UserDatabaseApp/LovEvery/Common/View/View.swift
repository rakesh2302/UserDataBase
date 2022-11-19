//
//  View.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/22/22.
//

import UIKit

class View: UIView {

    // MARK: IBOutlet properties

    @IBOutlet weak var title: Label!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var infoText: Label!

    // MARK: Functions

    func setupTextView() {
        textView.layer.cornerRadius = 8.0
        textView.layer.borderWidth = 2.0
        textView.layer.borderColor = UIColor.clear.cgColor
    }

    func setup() {
        layer.cornerRadius = 8.0
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.clear.cgColor
    }
}

extension View: UITextFieldDelegate {

    // MARK: TextFieldDelegate Functions

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        guard textField.text?.count == 0 else {
            return true
        }

        title.animateTitleUp(duration: 0.2)
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        guard textField.text?.count == 0 else {
            return
        }

        title.animateTitleToStartingPosition(duration: 0.2)
    }
}

extension View: UITextViewDelegate {

    // MARK: TextViewDelegate Functions

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        guard textView.text.count == 0 else {
            return true
        }

        title.animateTitleUp(duration: 0.2)
        return true
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        guard textView.text.count == 0 else {
            return
        }

        title.animateTitleToStartingPosition(duration: 0.2)
    }
    
    func setupAccessibilityIdentifier(_ isTextView: Bool = false) {
        if isTextView {
            textView.accessibilityIdentifier = AccessibilityIdentifiers.View.textView
        } else {
            textField.accessibilityIdentifier = AccessibilityIdentifiers.View.textField
        }
        title.accessibilityIdentifier = AccessibilityIdentifiers.View.titleLabel
        infoText.accessibilityIdentifier = AccessibilityIdentifiers.View.infoTextLabel
    }
}
