//
//  FindUserScreen.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/22/22.
//

import UIKit
import Resolver
import Combine

class FindUserScreen: ScreenBase {

    // MARK: IBOutlet Properties

    @IBOutlet weak var findUserButon: UIButton!
    @IBOutlet weak var findUserView: View!

    // MARK: Private Property

    private var cancellables = Set<AnyCancellable>()

}

extension FindUserScreen {

    // MARK: Default functions

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
}

extension FindUserScreen {

    // MARK: IBAction functions

    @IBAction func didTapOnSaveButton(_ sender: UIButton) {
        guard findUserView.textField.text == "" else {
            findUserView.infoText.text = ""
            showMovieDetailScreen()
            return
        }
        findUserView.infoText.text = "*Please enter the User Name"
        showAlertButtonTapped("Please enter the User Name")
    }
}
extension FindUserScreen {

    // MARK: Private functions

    private func setup() {
        setupNavigationcontroller()
        findUserView.setup()
        setupSaveButton()
        setupTapGestureRecognizer()
        setupAccessibilityIdentifier()
    }

    private func setupNavigationcontroller() {
        title = "Find User"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Baskerville-Bold", size: 24)!
        ]
    }

    private func setupSaveButton() {
        findUserButon.setup()
    }

    private func setupTapGestureRecognizer() {
        let tap = UITapGestureRecognizer(target: self,
                                         action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }

    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }

    private func showAlertButtonTapped(_ message: String) {
        let alert = UIAlertController(title: "",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: UIAlertAction.Style.default,
                                      handler: nil))
        present(alert, animated: true)
    }

    private func showMovieDetailScreen() {
        guard let availableUsersScreen =
                UIStoryboard(name: "Main",
                             bundle: .main)
                .instantiateViewController(withIdentifier: "AvailableUsersScreen") as? AvailableUsersScreen else {
            fatalError("Unable to Instantiate Image View Controller")
        }

        availableUsersScreen.viewModel.setup(userName: findUserView.textField.text)
        navigationController?.pushViewController(availableUsersScreen, animated: true)
    }

    private func setupAccessibilityIdentifier() {
        findUserView.setupAccessibilityIdentifier()
        findUserButon.accessibilityIdentifier = AccessibilityIdentifiers.FindUserScreen.findUserButon
    }
}
