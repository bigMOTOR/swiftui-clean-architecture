//
//  ContentView.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 19.12.2020.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    return ModelledViewFactory<RootView>()
      .build(RootView.ViewModel.init)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
