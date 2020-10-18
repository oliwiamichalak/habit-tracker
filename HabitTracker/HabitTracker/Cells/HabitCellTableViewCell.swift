//
//  HabitCellTableViewCell.swift
//  HabitTracker
//
//  Created by Oliwia Michalak on 06/10/2020.
//

import UIKit

class HabitCellTableViewCell: UITableViewCell {
    
    // MARK Public variable
    static let reuseID = "HabitCell"
    
    // MARK: UI Components
    let backgroundColorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    let horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 5
        stack.axis = .horizontal
        return stack
    }()
    
    let verticalStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .leading
        stack.distribution = .fillProportionally
        stack.spacing = 5
        stack.axis = .vertical
        return stack
    }()
    
    let habitLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Roboto", size: 20)
        label.textColor = .darkGray
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "This week"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Roboto", size: 15)
        label.textColor = .darkGray
        return label
    }()
    
    let doneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "1 / 3"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Roboto", size: 15)
        label.textColor = .darkGray
        return label
    }()
    
    
    // MARK: Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        super.layoutSubviews()
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public function
    func setCell(habit: Habit) {
        habitLabel.text = habit.name
    }
    
    // MARK: Private functions
    private func setupCell() {
        backgroundColor = .systemFill
        accessoryType = .checkmark
        self.layer.cornerRadius = 10
        
        addSubview(backgroundColorView)
        backgroundColorView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColorView.addSubview(verticalStackView)
        
        verticalStackView.addSubview(habitLabel)
        verticalStackView.addSubview(horizontalStackView)
        
        horizontalStackView.addSubview(timeLabel)
        horizontalStackView.addSubview(doneNumberLabel)
        
        NSLayoutConstraint.activate(
            [
                backgroundColorView.topAnchor.constraint(equalTo: contentView.topAnchor),
                backgroundColorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                backgroundColorView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
                backgroundColorView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
                verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
                verticalStackView.bottomAnchor.constraint(equalTo: backgroundColorView.bottomAnchor),
                verticalStackView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8)
            ]
        )
    }
}
