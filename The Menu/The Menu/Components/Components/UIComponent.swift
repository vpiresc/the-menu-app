//
//  UIComponent.swift
//  The Menu
//
//  Created by Vitor Pires on 01/12/23.
//

import Foundation
import SwiftUI

protocol UIComponent {
    var id: UUID { get }
    func render() -> AnyView
}
