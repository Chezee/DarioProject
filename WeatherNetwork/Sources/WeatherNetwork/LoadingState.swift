//
//  LoadingState.swift
//  
//
//  Created by ILLIA HOREVOI on 28.06.2022.
//

import Foundation

// We need this loading state to catch errors

public enum LoadingState<T> {
    case notStarted
    case loaded(T)
    case inProgress
    case error(Error)
    
    public var value: T? {
        switch self {
        case .loaded(let result):
            return result
        default:
            return nil
        }
    }
    
    public var error: Error? {
        switch self {
        case .error(let error):
            return error
        default:
            return nil
        }
    }
}
