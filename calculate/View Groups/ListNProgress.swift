//
//  ListNProgress.swift
//  calculate
//
//  Created by xtabbas on 8/3/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI

struct ListNProgress: View {
    @EnvironmentObject var UIState: UIStateModel
    @EnvironmentObject var checkList: CheckListModel
        
    var body: some View {
        
        let checkedList = checkList.items.filter { $0.isChecked }
        
        var progress = 0.0
        
        if (checkedList.count > 0) {
            progress = (100.0 / Double(checkList.items.count)) * Double(checkedList.count)
        }
                
        return VStack {
            if UIState.isChecking {
                Group {
                    ProgressSpur()
                        .padding(.horizontal, 35)
                        .padding(.top, 37)
                        .padding(.bottom, 37)
                        .animation(immediate)
                        .modifier(ProgressSpur_Animation())
                    
                    ProgressBar(progress: CGFloat(progress))
                        .padding(.horizontal, 35)
                        .padding(.vertical, 1)
                        .animation(immediate)
                        .modifier(ProgressBar_Animation())
                }
            }
            
            ZStack(alignment: .bottom) {
                CheckListUIKit()
//                CheckList()
                    .padding(.leading, 35)
                    .padding(.trailing, 0)
                
                Input(value: self.$UIState.inputValue)
                    .padding(.horizontal, 35)
                    .offset(y: UIState.isChecking ? 500 : 0)
            }
        }
    }
}

#if DEBUG
struct ListNProgress_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
            .environmentObject(UIStateModel())
            .environmentObject(CheckListModel())
    }
}
#endif
