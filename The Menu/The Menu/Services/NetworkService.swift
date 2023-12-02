//
//  NetworkService.swift
//  The Menu
//
//  Created by Vitor Pires on 01/12/23.
//

import Foundation

protocol NetworkService {
    func load(_ resourceName: String) async throws -> ScreenModel
}
