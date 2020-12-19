//
//  TimerRepositoryType.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 16.12.2020.
//

import Foundation
import Combine

protocol TimerRepositoryType: class  {
  func startTimer() -> AnyPublisher<TimeInterval, Never>
}

protocol TimerRepositoryHolderType {
  var timerRepository: TimerRepositoryType { get }
}
