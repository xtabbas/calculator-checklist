//
//  Input.swift
//  calculate
//
//  Created by xtabbas on 8/1/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI

struct Input: View {
    @State var fontSize: Font = regular28
    @State var opacity: Double = 0
    @Binding var value: Array<Character>
    
    var body: some View {
        HStack(spacing: 3) {
            Spacer()
            Text(" \(String(value))")
                .foregroundColor(.white)
                .font(fontSize)
                .animation(bouncy)
                .fixedSize()
            
            Rectangle()
                .frame(width: 2, height: 22)
                .foregroundColor(background2)
                .offset(y: 2)
                .opacity(opacity)
                .onAppear() {
                    withAnimation(repeatingAnimation) {
                        self.opacity = 1.0
                    }
                }
                
        }
        .frame(height: 4.5 * 9)
        .padding(.top, 1 * 9)
        .padding(.bottom, 0.5 * 9)
//        .background(background4)
    }
}

#if DEBUG
struct Input_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
            .environmentObject(UIStateModel())
            .environmentObject(CheckListModel())
    }
}
#endif
