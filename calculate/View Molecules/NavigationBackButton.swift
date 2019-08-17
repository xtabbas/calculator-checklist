//
//  NavigationBackButton.swift
//  calculate
//
//  Created by xtabbas on 8/3/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI

struct NavigationBackButton: View {
    @Binding var isSegueActive: Bool
    
    var body: some View {
        HStack {
            Button(action: { self.isSegueActive.toggle() }) {
                Image("arrow")
                    .frame(width: 30, height: 30)
                    .rotationEffect(Angle(degrees: 180))
                    .foregroundColor(primary)
                    .padding(.leading, 25)
                    .opacity(isSegueActive ? 1 : 0)
                    .offset(x: isSegueActive ? 0 : 50)
                    .animation(immediate)
            }
            Spacer()
        }
    }
}

#if DEBUG
struct NavigationBackButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Groups()
            NavigationBackButton(isSegueActive: .constant(false))
                .background(dark)
        }
        .environmentObject(UIStateModel())
        .environmentObject(CheckListModel())
        
    }
}
#endif
