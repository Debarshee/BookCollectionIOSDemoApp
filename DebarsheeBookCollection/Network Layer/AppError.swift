//
//  AppError.swift
//  DebarsheeBookCollection
//
//  Created by Debarshee on 4/6/21.
//

import Foundation

enum AppError: Error {
    case invalidUrl
    case serverError
    case noResponse
    case noData
    case parsingError
    case genericError(String)
}
