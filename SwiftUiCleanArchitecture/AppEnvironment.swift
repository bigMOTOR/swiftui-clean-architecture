//
//  AppEnvironment.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 16.12.2020.
//

import SwiftUI

struct AppEnvironment {
  let container: DIContainer
}

struct DIContainer: EnvironmentKey {
  let repositories: Repositories
  static var defaultValue: Self { DIContainer(repositories: Repositories()) }
}

extension EnvironmentValues {
  var diContainer: DIContainer {
    get { self[DIContainer.self] }
    set { self[DIContainer.self] = newValue }
  }
}

protocol ModelledView: View {
  associatedtype ViewModel: ObservableObject
  var viewModel: ViewModel { get }
  init(model: ViewModel)
}

struct ModelledViewFactory<T: ModelledView> {
  @Environment(\.diContainer) private var diContainer: DIContainer
    
  func build(_ builder: (DIContainer)->T.ViewModel) -> T {
    let viewModel = builder(diContainer)
    return T(model: viewModel)
  }
}
