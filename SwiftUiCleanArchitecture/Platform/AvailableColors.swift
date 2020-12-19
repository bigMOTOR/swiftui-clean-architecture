//
//  AvailableColors.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 17.12.2020.
//

import Foundation
import Combine
import SwiftUI

final class AvailableColors: ColorRepositoryType {
  var availableColors: AnyPublisher<[Color], Never> {
    return Just([
      .red,
      .orange,
      .blue
    ])
    .eraseToAnyPublisher()
  }
}
