//
//  AvailableUsersScreen.swift
//  Messages
//
//  Created by Rakesh Shetty on 9/22/22.
//

import UIKit
import Resolver
import Combine
import CombineCocoa

// MARK: final class function

final class SettingsTableViewDiffibleDataSource: UITableViewDiffableDataSource<String, User> {
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let settingsSection = itemIdentifier(for: IndexPath(item: 0, section: section)) else { return nil }
        return snapshot().sectionIdentifier(containingItem: settingsSection)
    }
}

class AvailableUsersScreen: ScreenBase {

    // MARK: Private Properties

    private typealias DataSource = SettingsTableViewDiffibleDataSource
    private typealias Snapshot = NSDiffableDataSourceSnapshot<String, User>
    private var cancellables = Set<AnyCancellable>()

    @Published private var messages = [String: [User]]() {
        didSet { updateDataSource() }
    }

    private lazy var dataSource: DataSource = {
        DataSource(tableView: tableView) { [unowned self] tableView, indexPath, user -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: AvailableUsersCell.reuseIdentifier,
                                          for: indexPath) as? AvailableUsersCell
            cell?.setup(user: user)
            cell?.setupAccessibilityIdentifier()
            return cell
        }
    }()

    // MARK: Private Dependency

    @Injected var viewModel: AvailableUsersViewModel

    // MARK: IBOutlet Properties

    @IBOutlet weak var addButon: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var availableUsersStackView: UIStackView!
}

extension AvailableUsersScreen {

    // MARK: Default functions

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        getMessages()
    }
}

extension AvailableUsersScreen {

    // MARK: Private Functions
    
    private func setup() {
        setupNavigationController()
        setupSearchBar()
        setupAddButton()
        setupAccessibilityIdentifier()
    }

    private func setupNavigationController() {
        title = "Available Users"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "Baskerville-Bold", size: 24)!
        ]

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                            target: self,
                                                            action: #selector(refreshUsers))
    }

    @objc private func refreshUsers() {
        getMessages()
    }

    private func setupSearchBar() {
        searchBar.autocapitalizationType = .none
    }

    private func setupAddButton() {
        addButon.layer.cornerRadius = 8.0
        addButon.layer.borderWidth = 2.0
        addButon.layer.borderColor = UIColor.clear.cgColor
    }

    private func getMessages() {
        searchBar.text = ""
        showLoadingView()
        viewModel.getMessages()
            .sink { [unowned self] in
                guard let message = $0,
                      let messages = message.userList else {
                          self.checkVisibility()
                          return
                }

                self.messages = messages
                self.checkVisibility()
            }
            .store(in: &cancellables)
    }

    private func checkVisibility() {
        availableUsersStackView.isHidden = (messages.keys.count == 0)
        searchBar.isHidden = viewModel.isUserNamePresent()
        removeLoadingView()
    }

    private func updateDataSource() {
        var snapshot = Snapshot()
        snapshot.appendSections(Array(messages.keys))
        messages.forEach { key, value in
            snapshot.appendItems(value, toSection: key)
        }
        dataSource.apply(snapshot, animatingDifferences: false)
    }

    private func setupAccessibilityIdentifier() {
        addButon.accessibilityIdentifier = AccessibilityIdentifiers.AvailableUsersScreen.addButon
        tableView.accessibilityIdentifier = AccessibilityIdentifiers.AvailableUsersScreen.tableView
        searchBar.accessibilityIdentifier = AccessibilityIdentifiers.AvailableUsersScreen.searchBar
    }
}

extension AvailableUsersScreen: UISearchBarDelegate {

    // MARK: SearchBar Delegate functions

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.getMessages()
            .compactMap {
                return $0?.userList?.filter {
                    guard searchText != "" else {
                        return true
                    }
                    return ($0.key.lowercased().contains(searchText.lowercased()) && $0.key != "")
                }
            }
            .sink { [unowned self] in
                self.messages = $0
            }
            .store(in: &cancellables)

    }
}

extension AvailableUsersScreen {

    // MARK: IBAction functions

    @IBAction func didTapOnSaveButton(_ sender: UIButton) {
        let keyWindow = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows
            .filter({$0.isKeyWindow}).first

        guard let keyWindow = keyWindow,
              let tabBar = keyWindow.rootViewController as? UITabBarController else {
                  return
              }

        tabBar.selectedIndex = 0
    }
}

extension AvailableUsersScreen: UITableViewDelegate {

    // MARK: IBAction functions

    func tableView(_ tableView: UITableView,
                   willDisplayHeaderView view: UIView,
                   forSection section: Int) {
        let titleView = view as! UITableViewHeaderFooterView
        titleView.textLabel?.text =  titleView.textLabel?.text?.capitalized
    }
}
