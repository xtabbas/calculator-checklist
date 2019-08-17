//
//  ProgressSpur.swift
//  calculate
//
//  Created by xtabbas on 8/3/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI

struct ProgressSpur: View {
    @EnvironmentObject var checkList: CheckListModel
    
    var body: some View {
        let checkedList = checkList.items.filter { $0.isChecked }
        
        return HStack {
            VStack(alignment: .leading, spacing: -14) {
                
                ZStack {
                    HStack(spacing: 0) {
                        Text("Dont get too lazy!")
                            .font(regular20)
                            .foregroundColor(background3)
                            .opacity(0.7)
                            .fixedSize()
                            .offset(x: checkedList.count > 0 ? -200 : 0)
                            .clipped()
                            .animation(Animation.easeOut(duration: 0.3))
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 0) {
                        Text("Hurrahh!!!!")
                            .font(regular20)
                            .foregroundColor(background4)
//                            .opacity(0.7)
                            .fixedSize()
                            .offset(x: checkedList.count > 0 ? 0 : 200)
                            .clipped()
                            .animation(Animation.easeOut(duration: 0.3).delay(0.4))
                        
                        Spacer()
                    }
                }
                
                
                ZStack {
                    HStack(spacing: 0) {
                        Text("start now!")
                            .font(regular40)
                            .foregroundColor(background4)
                            .fixedSize()
                            .offset(x: checkedList.count > 0 ? -200 : 0)
                            .clipped()
                            .animation(Animation.easeOut(duration: 0.3).delay(0.3))
                        
                        Spacer()
                    }
                    
                    HStack(spacing: 0) {
                        Text("keep going that way!")
                            .font(regular20)
                            .foregroundColor(background3)
                            .opacity(0.7)
                            .fixedSize()
                            .offset(x: checkedList.count > 0 ? 0 : 200)
                            .clipped()
                            .animation(Animation.easeOut(duration: 0.3).delay(0.5))
                        
                        Spacer()
                    }
                }
                
            }
            
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#if DEBUG
struct ProgressSpur_Previews : PreviewProvider {
    static var previews: some View {
        Group {
//            ProgressSpur()
//                .background(dark)
//                .environmentObject(CheckListModel())
            Groups()
                   .environmentObject(UIStateModel())
                    .environmentObject(CheckListModel())
        }
    }
}
#endif
