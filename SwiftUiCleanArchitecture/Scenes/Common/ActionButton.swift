//
//  CircleButton.swift
//  SwiftUiCleanArchitecture
//
//  Created by Nikolay Fiantsev on 16.12.2020.
//

import SwiftUI

struct ActionButton: View {
  
  let text: String
  let color: Color
  let imageName = "timer"
  let action: ()->Void
  
  var body: some View {
    Button(action: action) {
      HStack {
        Image(systemName: imageName)
          .imageScale(.large)
        Text(text)
          .font(.title3)
          .fontWeight(.semibold)
      }
      .padding()
      .frame(maxWidth: .infinity)
      .foregroundColor(Color.white)
      .background(color)
      .cornerRadius(14)
      .padding()
    }
  }
}

#if DEBUG
struct ActionButton_Previews: PreviewProvider {
  static var previews: some View {
    return ActionButton(text: "Go-go-go!", color: .blue) {}
      .border(Color.blue)
  }
}
#endif
