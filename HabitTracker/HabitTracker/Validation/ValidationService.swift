//
//  ValidationService.swift
//  HabitTracker
//
//  Created by Oliwia Michalak on 01/11/2020.
//

import Foundation

enum ValidationError: LocalizedError {
    case invalidValue
    case invalidAimName
    case aimNameTooShort
    case aimNameTooLong
    case invalidDuration
    case emptyDuration
    case invalidDone
    case emptyDone
    
    var errorDescription: String? {
        switch self {
        case .invalidValue:
            return "You have invalid value"
        case .invalidAimName:
            return "You have invalid aim name"
        case .aimNameTooShort:
            return "Your aim's name is too short"
        case .aimNameTooLong:
            return "Your aim's name is too long"
        case .invalidDuration:
            return "You have invalid duration value"
        case .emptyDuration:
            return "Add duration"
        case .invalidDone:
            return "You have invalid done value"
        case .emptyDone:
            return "Add how many times on week you're going to work on your aim"
        }
    }
}

struct ValidationService {
    func validateAimName(_ aim: String?) throws -> String {
        guard let aim = aim else { throw
            ValidationError.invalidAimName }
        guard aim.count >= 3 else { throw
            ValidationError.aimNameTooShort }
        guard aim.count <= 12 else { throw
            ValidationError.aimNameTooLong }
        return aim
    }
    
    func validateDuration(_ duration: Int?) throws -> Int {
        guard let duration = duration else { throw
            ValidationError.emptyDuration }
        guard duration >= 0 else { throw
            ValidationError.invalidDuration }
        return duration
    }
    
    func validateDone(_ done: Int?) throws -> Int {
        guard let done = done else { throw
            ValidationError.emptyDone }
        guard done >= 0 else { throw
            ValidationError.invalidDone }
        return done
    }
}
