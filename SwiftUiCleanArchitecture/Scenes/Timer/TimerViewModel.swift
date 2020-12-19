//
//  TimerViewModel.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 16.12.2020.
//

import Foundation
import Combine
import SwiftUI

extension TimerView {
  final class ViewModel: ObservableObject {
    
    typealias UseCases = ObserveTimerUseCase

    @Published var timerText: String = ""
    let selectedColor: Color
    
    private let _useCases: UseCases
    private var _cancellable: AnyCancellable?

    init(useCases: UseCases, selectedColor: Color) {
      self._useCases = useCases
      self.selectedColor = selectedColor
    }

    func startTimer() {
      _cancellable = _useCases.startTimer()
        .prepend(0)
        .map(\.stringDuration)
        .receive(on: RunLoop.main)
        .sink { [unowned self] in
          timerText = $0
        }
    }
    
    func stopTimer() {
      _cancellable?.cancel()
      _cancellable = nil
    }
  }
}

private extension TimeInterval {
  private var seconds: Int {
    return Int(self) % 60
  }
  
  private var minutes: Int {
    return (Int(self) / 60 ) % 60
  }
  
  var stringDuration: String {
    return "\(String(format: "%02dm", minutes)) : \(String(format: "%02ds", seconds))"
  }
}
