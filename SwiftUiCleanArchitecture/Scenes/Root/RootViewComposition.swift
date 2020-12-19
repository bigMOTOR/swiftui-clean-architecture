//
//  RootViewComposition.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 17.12.2020.
//

import Foundation

extension RootView.ViewModel {
  convenience init(diContainer: DIContainer) {
    self.init(useCases: diContainer.rootViewContext)
  }
}

private extension DIContainer {
  var rootViewContext: RootViewContext {
    return RootViewContext(colorsRepository: repositories.colorRepository)
  }
}

private final class RootViewContext: ColorRepositoryHolderType {
  let colorsRepository: ColorRepositoryType
  
  init(colorsRepository: ColorRepositoryType) {
    self.colorsRepository = colorsRepository
  }
}

extension RootViewContext: RootView.ViewModel.UseCases {}
