//
//  RootView.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 16.12.2020.
//

import SwiftUI

struct RootView: ModelledView {
  enum Segue {
    case toTimer
  }
  
  @StateObject var viewModel: ViewModel
  @State private var _navigation: Segue? = nil
  @State private var _selectedColor: Color? = nil
  
  init(model: ViewModel) {
    _viewModel = .init(wrappedValue: model)
  }

  var body: some View {
    NavigationView {
      VStack(alignment: .center) {
        NavigationLink(destination: _getTimerView(selectedColor: _selectedColor ?? .black), tag: .toTimer, selection: $_navigation) { EmptyView() }
        
        Text("Hello, SwiftUI!")
          .padding()

        ForEach(0..<viewModel.availableColors.count) { idx in
          _createButton(color: viewModel.availableColors[idx])
        }
      }
    }
  }
  
  private func _createButton(color: Color) -> some View {
    ActionButton(text: "Go To Timer", color: color) {
      _selectedColor = color
      _navigation = .toTimer
    }
  }
  
  private func _getTimerView(selectedColor: Color) -> TimerView {
    return ModelledViewFactory<TimerView>()
      .build { TimerView.ViewModel(diContainer: $0, selectedColor: selectedColor) }
  }
}
