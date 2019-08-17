//
//  Tabs.swift
//  calculate
//
//  Created by xtabbas on 7/18/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI

struct NavigationTabs : View {
    @EnvironmentObject var UIState: UIStateModel
    
    var body: some View {
        return VStack {
            HStack {
                
                Button(action: {
                    self.UIState.isChecking = false
                    self.UIState.inputValue = []
                }) {
                    VStack {
                        Text("LETS CALC!")
                            .font(self.UIState.isChecking ? bold14 : bold16)
                            .kerning(3.5)
                            .foregroundColor(self.UIState.isChecking ? background2 : background5)
                        
                        
                    }
                    .frame(width: 165, height: 25)
                    
                }
                
                Button(action: {
                    self.UIState.isChecking = true
                    self.UIState.inputValue = []
                }) {
                    VStack {
                        Text("LETS CHECK!")
                            .font(self.UIState.isChecking ? bold16 : bold14)
                            .kerning(3.5)
                            .foregroundColor(self.UIState.isChecking ? background5 : background2)
                        
                    }
                    .frame(width: 165, height: 25)
                }
            }
            
            HStack {
                Button(action: {
                    self.UIState.isChecking = false
                    self.UIState.inputValue = []
                }) {
                    Rectangle()
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        .frame(width: 165, height: 4)
                        .offset(y: -10)
                        .foregroundColor(background5)
                        .offset(x: self.UIState.isChecking ? 173 : 0)
                        .animation(immediate)
                }
                
                Button(action: {
                    self.UIState.isChecking = true
                    self.UIState.inputValue = []
                }) {
                    Rectangle()
                        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        .frame(width: 165, height: 4)
                        .offset(y: -10)
                        .foregroundColor(background2)
                        .offset(x: self.UIState.isChecking ? -173 : 0)
                        .animation(immediate)
                }
                
            }
        }
    }
}

#if DEBUG
struct NavigationTabs_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTabs()
            .environmentObject(UIStateModel())
    }
}
#endif
