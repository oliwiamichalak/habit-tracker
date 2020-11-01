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
    let habitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Roboto", size: 20)
        label.textColor = .systemGreen
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Roboto", size: 11)
        label.textColor = .darkGray
        return label
    }()
    
    let doneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont(name: "Roboto", size: 11)
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
        timeLabel.text = "How many times in a week \(String(habit.minimum))"
        doneNumberLabel.text = "Ho many left \(String(habit.howManyDone))"
    }
    
    // MARK: Private functions
    private func setupCell() {
        backgroundColor = .systemFill
        accessoryType = .checkmark
        self.layer.cornerRadius = 10
        
        addSubview(habitLabel)
        addSubview(timeLabel)
        addSubview(doneNumberLabel)
        
        NSLayoutConstraint.activate(
            [
                habitLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
                habitLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
                habitLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
                habitLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
                
                timeLabel.topAnchor.constraint(equalTo: habitLabel.bottomAnchor, constant: 5),
                timeLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
                timeLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
                timeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
                
                doneNumberLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5),
                doneNumberLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.2),
                doneNumberLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8),
                doneNumberLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            ]
        )
    }
}
