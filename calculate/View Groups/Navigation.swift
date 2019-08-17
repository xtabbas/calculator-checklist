//
//  Group1.swift
//  calculate
//
//  Created by xtabbas on 8/2/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI

struct Navigation: View {
    @EnvironmentObject var UIState: UIStateModel
    
    var body: some View {
        ZStack {
            NavigationTabs()
                .offset(y: UIState.isSegueActive ? -200 : 0)
                .animation(Animation.spring())
            
            NavigationBackButton(isSegueActive: self.$UIState.isSegueActive)
                .padding(.top, 30)
                .opacity(UIState.isSegueActive ? 1 : 0)
        }
    }
}

#if DEBUG
struct Group1_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
            .environmentObject(UIStateModel())
            .environmentObject(CheckListModel())
    }
}
#endif
