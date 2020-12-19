//
//  RepositoriesComposition.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 17.12.2020.
//

import Foundation

final class Repositories {
  // Open Question: Lifecycle of Repository?
  lazy var timerRepository: TimerRepositoryType = {
    return TickTimer()
  }()
  
  lazy var colorRepository: ColorRepositoryType = {
    return AvailableColors()
  }()
}
