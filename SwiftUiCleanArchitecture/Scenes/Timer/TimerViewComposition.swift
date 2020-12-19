//
//  TimerViewComposition.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 17.12.2020.
//

import Foundation
import SwiftUI

extension TimerView.ViewModel {
  convenience init(diContainer: DIContainer, selectedColor: Color) {
    self.init(useCases: diContainer.timerViewContext, selectedColor: selectedColor)
  }
}

private extension DIContainer {
  var timerViewContext: TimerViewContext {
    return TimerViewContext(timerRepository: repositories.timerRepository)
  }
}

private final class TimerViewContext: TimerRepositoryHolderType {
  let timerRepository: TimerRepositoryType
  
  init(timerRepository: TimerRepositoryType) {
    self.timerRepository = timerRepository
  }
}

extension TimerViewContext: TimerView.ViewModel.UseCases {}
