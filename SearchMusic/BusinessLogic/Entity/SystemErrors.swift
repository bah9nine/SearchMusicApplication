//
//  SystemErrors.swift
//  SearchMusic
//
//  Created by Иван Миронов on 07.10.2021.
//

import Foundation

enum SystemErrors: LocalizedError {
    case mappingError
    case incorrectRequest
    
    var errorDescription: String? {
        switch self {
        case .mappingError:
            return "mapping error"
        case .incorrectRequest:
            return "incorrect request"
            
        }
    }
}
