//
//  TickTimer.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 16.12.2020.
//

import Foundation
import Combine

final class TickTimer: TimerRepositoryType {
  func startTimer() -> AnyPublisher<TimeInterval, Never> {
    return _startTimer()
  }
  
  private func _startTimer(since: Date = Date()) -> AnyPublisher<TimeInterval, Never> {
    return Timer.publish(every: 1.0, on: .main, in: .default)
      .autoconnect()
      .map { $0.timeIntervalSince(since) }
      .eraseToAnyPublisher()
  }
}
