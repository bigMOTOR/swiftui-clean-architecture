//
//  TimerView.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 16.12.2020.
//

import SwiftUI

struct TimerView: ModelledView {
  
  @StateObject var viewModel: ViewModel
  @State private var _isTimerOn: Bool = false
  
  init(model: ViewModel) {
    _viewModel = .init(wrappedValue: model)
  }
  
  var body: some View {
    Text(viewModel.timerText)
      .font(.system(.headline, design: .monospaced))
      .padding()
    
    CircleButton(color: viewModel.selectedColor) {
      switch _isTimerOn {
      case false:
        viewModel.startTimer()
      case true:
        viewModel.stopTimer()
      }
      
      _isTimerOn.toggle()
    }
  }
  
}
