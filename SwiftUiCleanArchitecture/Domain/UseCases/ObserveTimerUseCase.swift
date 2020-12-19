//
//  ObserveTimerUseCase.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 16.12.2020.
//

import Foundation
import Combine

protocol ObserveTimerUseCase {
  func startTimer() -> AnyPublisher<TimeInterval, Never>
}

extension ObserveTimerUseCase where Self: TimerRepositoryHolderType {
  func startTimer() -> AnyPublisher<TimeInterval, Never> {
    return self.timerRepository.startTimer()
  }
}
