//
//  NewAimViewController.swift
//  HabitTracker
//
//  Created by Oliwia Michalak on 06/10/2020.
//

import UIKit

protocol NewAimViewControllerDelegate: class {
    func addNewHabit(newHabit: Habit)
}

class NewAimViewController: UIViewController {
    
    // MARK: Public variables
    weak var nawAimDelegate: NewAimViewControllerDelegate?
    
    // MARK: Private variables
    private let valdation: ValidationService?
    
    // MARK: UI Components
    private let newAimLabel: UILabel = {
        let label = UILabel()
        label.text = "Your new goal"
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let howManyTimesLabel: UILabel = {
        let label = UILabel()
        label.text = "How long"
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let howManyTimesInAWeek: UILabel = {
        let label = UILabel()
        label.text = "How many times in a week"
        label.textColor = .label
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let newAimTextField: UITextField = {
        let textField = UITextField()
        textField.adjustsFontForContentSizeCategory = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let howManyTimesTextField: UITextField = {
        let textField = UITextField()
        textField.adjustsFontForContentSizeCategory = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let howManyTimesInAWeekTextField: UITextField = {
        let textField = UITextField()
        textField.adjustsFontForContentSizeCategory = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveNewGoal(_ :)), for: .touchUpInside)
        button.setTitle("Done!", for: .selected)
        button.backgroundColor = .systemGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    init(validation: ValidationService) {
        self.valdation = validation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private functions
    private func setupUI() {
        view.backgroundColor = .secondarySystemBackground
        
        view.addSubview(newAimLabel)
        view.addSubview(newAimTextField)
        view.addSubview(howManyTimesLabel)
        view.addSubview(howManyTimesTextField)
        view.addSubview(howManyTimesInAWeek)
        view.addSubview(howManyTimesInAWeekTextField)
        view.addSubview(saveButton)
        
        NSLayoutConstraint.activate(
            [
                newAimLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                newAimLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
                newAimLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                newAimLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                newAimTextField.topAnchor.constraint(equalTo: newAimLabel.bottomAnchor, constant: 5),
                newAimTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                newAimTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
                newAimTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                howManyTimesLabel.topAnchor.constraint(equalTo: newAimTextField.bottomAnchor, constant: 5),
                howManyTimesLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                howManyTimesLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
                howManyTimesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                howManyTimesTextField.topAnchor.constraint(equalTo: howManyTimesLabel.bottomAnchor, constant: 5),
                howManyTimesTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                howManyTimesTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
                howManyTimesTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                howManyTimesInAWeek.topAnchor.constraint(equalTo: howManyTimesTextField.bottomAnchor, constant: 5),
                howManyTimesInAWeek.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                howManyTimesInAWeek.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
                howManyTimesInAWeek.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                howManyTimesInAWeekTextField.topAnchor.constraint(equalTo: howManyTimesInAWeek.bottomAnchor, constant: 5),
                howManyTimesInAWeekTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                howManyTimesInAWeekTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
                howManyTimesInAWeekTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                saveButton.topAnchor.constraint(equalTo: howManyTimesInAWeekTextField.bottomAnchor, constant: 15),
                saveButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
                saveButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
                saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ]
        )
    }
    
    @objc func saveNewGoal(_ : UIButton) {
        do {
            let aimName = try valdation?.validateAimName(newAimTextField.text)
            let howLong = try valdation?.validateDuration(Int(howManyTimesTextField.text!))
            let onWeek = try valdation?.validateDone(Int(howManyTimesInAWeekTextField.text!))
            
            let newHabit = Habit(name: aimName ?? "", minimum: howLong ?? 0, howManyDone: onWeek ?? 0)
            nawAimDelegate?.addNewHabit(newHabit: newHabit)
        } catch {
            print(error)
        }
    }
}

