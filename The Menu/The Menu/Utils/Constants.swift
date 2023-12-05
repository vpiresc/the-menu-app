//
//  Constants.swift
//  The Menu
//
//  Created by Vitor Pires on 01/12/23.
//

import Foundation

struct Constants {
    
    struct ScreenResources {
        static let baseUrl = "localhost:3000"
        static let menuList = "menu-list"
        
        static func resource(for resourceName: String) -> URL? {
            var components = URLComponents()
            components.scheme = "http"
            components.host = baseUrl
            components.path = "/\(resourceName)"
            return components.url
        }
    }
    
    struct Urls {
        static let baseUrl = "http://localhost:3000"
        static let menuList = "\(baseUrl)/menu-list"
        
        static func menuItemDetail(itemId: Int) -> String {
            return "\(baseUrl)/menu-item-detail/\(itemId)"
        }
    }
}
