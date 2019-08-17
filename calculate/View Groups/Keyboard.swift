//
//  InputNKeyboard.swift
//  calculate
//
//  Created by xtabbas on 8/3/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI

struct Keyboard: View {
    @EnvironmentObject var UIState: UIStateModel
    
    @State private var offset: Double = 80
    @State private var opacity: Double = 0
    
    var body: some View {
        return Group {
            
            DividerButtons()
              .padding(.top, CGFloat(1 * 9))
              .padding(.bottom, 0 * 9)
              .frame(height: 4.5 * 9)
              .frame(maxHeight: UIState.isChecking ? 0 : .infinity)
              .offset(y: UIState.isChecking ? 350 : 0)
              .opacity(UIState.isChecking ? 0.5 : 1)
              .animation(immediate.delay(0.1))
        
            Buttons(value: $UIState.inputValue)
              .frame(height: 30 * 9)
              .padding(.bottom, 0.5 * 9)
              .offset(y: UIState.isChecking ? 300 : 0)
              .animation(immediate.speed(0.8))
              .frame(maxHeight: UIState.isChecking ? 0 : .infinity)
            
        }
    }
}

#if DEBUG
struct Keyboard_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
            .environmentObject(UIStateModel())
            .environmentObject(CheckListModel())
    }
}
#endif
