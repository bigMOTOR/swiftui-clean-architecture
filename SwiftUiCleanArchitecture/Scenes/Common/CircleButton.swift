//
//  CircleButton.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 16.12.2020.
//

import SwiftUI

struct CircleButton: View {
  
  let color: Color
  let imageName: String = "timer"
  let action: ()->Void
  
  private let _buttonDiameter: CGFloat = 50.0

  var body: some View {
    Button(action: action) {
      Image(systemName: imageName)
        .imageScale(.large)
        .frame(width: _buttonDiameter, height: _buttonDiameter)
    }
    .foregroundColor(Color.white)
    .background(color)
    .clipShape(Circle())
  }
}

#if DEBUG
struct CircleButton_Previews: PreviewProvider {
  static var previews: some View {
    return CircleButton(color: .blue) {}
      .border(Color.blue)
  }
}
#endif

