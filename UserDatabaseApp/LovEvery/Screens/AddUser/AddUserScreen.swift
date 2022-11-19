//
//  AddUserScreen.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/22/22.
//

import UIKit
import Resolver
import Combine

class AddUserScreen: ScreenBase {

    // MARK: IBOutlet properties

    @IBOutlet weak var messageView: View!
    @IBOutlet weak var userNameView: View!
    @IBOutlet weak var subjectView: View!
    @IBOutlet weak var addUserButon: UIButton!

    // MARK: Dependencies

    @Injected var viewModel: AddUserViewModel

    // MARK: Private property

    private var cancellables = Set<AnyCancellable>()
}

extension AddUserScreen {

    // MARK: Default functions

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

extension AddUserScreen {

    // MARK: IBAction functions

    @IBAction func didTapOnSaveButton(_ sender: UIButton) {
        showLoadingView()
        let user = viewModel.getUser(from: userNameView.textField.text,
                                        subject: subjectView.textField.text,
                                        message: messageView.textView.text)
        guard validateUserName() &&
              validateSubject() &&
              validateMessage() else {
                  showAlertButtonTapped("Please fill all the required fields.")
                  return
              }

        viewModel.addUser(user)
            .sink { [unowned self] response in
                guard let response = response,
                      response.statusCode == 200 else {
                    self.showAlertButtonTapped("Failed to save message.")
                    return
                }
                self.showAlertButtonTapped("Your message has been saved.")
                self.removeUserInfo()
            }
            .store(in: &cancellables)
    }
}

extension AddUserScreen {

    // MARK: Private Functions

    private func setup() {
        setupNavigationController()
        setupSaveButon()
        messageView.setupTextView()
        setupTapGestureRecognizer()
        setupAccessibilityIdentifier()
    }

    private func setupNavigationController() {
        title = "Add User"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Baskerville-Bold", size: 24)!
        ]
    }

    private func setupTapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    private func setupSaveButon() {
        addUserButon.setup()
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    private func showAlertButtonTapped(_ message: String) {
        removeLoadingView()
        let alert = UIAlertController(title: "",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        self.present(alert, animated: true)
    }

    private func validateUserName() -> Bool {
        guard userNameView.textField.text == "" else {
            userNameView.infoText.text = ""
            return true
        }

        userNameView.infoText.text = "* Please enter the User Name"
        return false
    }

    private func validateSubject() -> Bool {
        guard subjectView.textField.text == "" else {
            subjectView.infoText.text = ""
            return true
        }

        subjectView.infoText.text = "* Please enter the User Name"
        return false
    }

    private func validateMessage() -> Bool {
        guard messageView.textView.text == "" else {
            messageView.infoText.text = ""
            return true
        }

        messageView.infoText.text = "* Please enter the User Name"
        return false
    }

    private func removeUserInfo() {
        userNameView.textField.text = ""
        subjectView.textField.text = ""
        messageView.textView.text = ""
    }

    private func setupAccessibilityIdentifier() {
        messageView.setupAccessibilityIdentifier(true)
        userNameView.setupAccessibilityIdentifier()
        subjectView.setupAccessibilityIdentifier()
        addUserButon.accessibilityIdentifier = AccessibilityIdentifiers.AddUserScreen.addUserButon
    }
}
