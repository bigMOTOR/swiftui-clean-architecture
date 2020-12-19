//
//  ObserveAvailableColorsUseCase.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 17.12.2020.
//

import Foundation
import Combine
import SwiftUI

protocol ObserveAvailableColorsUseCase {
  var availableColors: AnyPublisher<[Color], Never> { get }
}

extension ObserveAvailableColorsUseCase where Self: ColorRepositoryHolderType {
  var availableColors: AnyPublisher<[Color], Never> {
    return self.colorsRepository.availableColors
  }
}
