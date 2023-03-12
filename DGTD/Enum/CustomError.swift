//
//  CustomError.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/12.
//
import Foundation

enum CustomError: Error {
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .unknown:
            return NSLocalizedString("An unknown error occurred.", comment: "Unknown error")
        }
    }
}
