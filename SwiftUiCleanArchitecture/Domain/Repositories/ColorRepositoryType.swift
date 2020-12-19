//
//  ColorRepositoryType.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 17.12.2020.
//

import Foundation
import Combine
import SwiftUI

protocol ColorRepositoryType: class {
  var availableColors: AnyPublisher<[Color], Never> { get }
}

protocol ColorRepositoryHolderType {
  var colorsRepository: ColorRepositoryType { get }
}
