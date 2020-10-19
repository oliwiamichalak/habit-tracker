//
//  MainViewController.swift
//  HabitTracker
//
//  Created by Oliwia Michalak on 06/10/2020.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: Public properites
    var habits: [Habit] = []
    let newAimVC = NewAimViewController()
    
    // MARK: UI Components
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont(name: "Roboto", size: 25)
        label.numberOfLines = 0
        label.text = "Track your progress"
        label.textColor = .systemGreen
        return label
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.layer.cornerRadius = 10
        tableView.separatorInset = UIEdgeInsets(top: 10, left: 10, bottom: -100, right: 10)
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = .green
        return tableView
    }()

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        newAimVC.nawAimDelegate = self
        setupUI()
        setupTableView()
    }
    
    // MARK: Private functions
    private func setupUI() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                titleLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1),
                titleLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8)
            ]
        )
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                tableView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
                tableView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.7),
                tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20)
            ]
        )
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = 80
        tableView.register(HabitCellTableViewCell.self, forCellReuseIdentifier: "HabitCell")
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HabitCell") as! HabitCellTableViewCell
        let habit = habits[indexPath.row]
        cell.setCell(habit: habit)
        return cell
    }
}

extension MainViewController: NewAimViewControllerDelegate {
    func addNewHabit(newHabit: Habit) {
        habits.append(newHabit)
        tableView.reloadData()
    }
}
