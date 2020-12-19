//
//  StartViewModel.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 16.12.2020.
//

import Foundation
import Combine
import SwiftUI

extension RootView {
  final class ViewModel: ObservableObject {
    
    typealias UseCases = ObserveAvailableColorsUseCase
    
    @Published var availableColors: [Color] = []
    private var _cancellables: Set<AnyCancellable> = []
    
    init(useCases: UseCases) {
      useCases.availableColors
        .removeDuplicates()
        .sink { [unowned self] in
          availableColors = $0
        }
        .store(in: &_cancellables)
    }
  }
}
