//
//  UIComponent.swift
//  The Menu
//
//  Created by Vitor Pires on 01/12/23.
//

import Foundation
import SwiftUI

protocol UIComponent {
    var uniqueId: String { get }
    func render() -> AnyView
}
