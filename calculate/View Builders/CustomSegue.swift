//
//  CustomSegue.swift
//  calculate
//
//  Created by xtabbas on 8/2/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: CustomSegue
/// Takes two screen and display the second once as a segue
struct CustomSegue<FirstScreen: View, SecondScreen: View> : View {
    
    let firstScreen: FirstScreen
    let secondScreen: SecondScreen
    
    @Binding var isActive: Bool
    
    @State private var offset: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        ZStack {
            VStack {
                firstScreen
                    .offset(x: isActive ? -UIScreen.main.bounds.width : 0)
            }
            
            
            if isActive {
                secondScreen
                    .modifier(SecondScreen_Animation())
                
            }
        }
    }
}

#if DEBUG
struct CustomSegue_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
            .environmentObject(UIStateModel())
            .environmentObject(CheckListModel())
    }
}
#endif

