//
//  ScreenBase.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/22/22.
//

import UIKit

class ScreenBase: UIViewController {

    // MARK: Default Functions

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension ScreenBase {

    // MARK: Loading Functions

    func showLoadingView() {
        showSpinner(onView: self.view)
    }

    func removeLoadingView() {
        removeSpinner()
    }

}
