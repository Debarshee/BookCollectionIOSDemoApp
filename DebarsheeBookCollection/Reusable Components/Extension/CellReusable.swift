//
//  CellReusableProtocol.swift
//  DebarsheeBookCollection
//
//  Created by Debarshee on 4/6/21.
//

import Foundation

protocol CellReusable {
    static var cellIdentifier: String { get }
}

extension CellReusable {
    static var cellIdentifier: String {
        String(describing: self)
    }
}
