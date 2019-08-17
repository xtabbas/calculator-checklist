//
//  Groups.swift
//  calculate
//
//  Created by xtabbas on 8/1/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI
import Foundation

// MARK: Fonts
let regular90 = Font.custom("TitilliumWeb-Regular", size: 90)
let regular18 = Font.custom("TitilliumWeb-Regular", size: 18)
let regular20 = Font.custom("TitilliumWeb-Regular", size: 20)
let regular24 = Font.custom("TitilliumWeb-Regular", size: 24)
let regular28 = Font.custom("TitilliumWeb-Regular", size: 28)
let regular30 = Font.custom("TitilliumWeb-Regular", size: 30)
let regular40 = Font.custom("TitilliumWeb-Regular", size: 40)
let regular14 = Font.custom("TitilliumWeb-Regular", size: 14)
let regular16 = Font.custom("TitilliumWeb-Regular", size: 16)

let regular1 = Font.custom("TitilliumWeb-Regular", size: 1)

let bold14 = Font.custom("TitilliumWeb-Bold", size: 14)
let bold16 = Font.custom("TitilliumWeb-Bold", size: 16)
let bold20 = Font.custom("TitilliumWeb-Bold", size: 20)

let semibold14 = Font.custom("TitilliumWeb-SemiBold", size: 14)
let semibold24 = Font.custom("TitilliumWeb-SemiBold", size: 24)

// MARK: Colors
let dark = Color("dark")
let primary = Color("primary")
let secondary = Color("secondary")
let background1 = Color("background1")
let background2 = Color("background2")
let background3 = Color("background3")
let background4 = Color("background4")
let background5 = Color("background5")

let listItemHeight = CGFloat(30)

struct Groups: View {
    @EnvironmentObject var UIState: UIStateModel
    @EnvironmentObject var checkList: CheckListModel
    
    var body: some View {
        Canvas {
            Navigation()

            Spacer()

            GrandTotal(collapsed: $UIState.isSegueActive)
            
            CustomSegue(
                firstScreen: Group {
                    ListNProgress()
                    Keyboard()
                },
                secondScreen: ItemProfile(),
                isActive: $UIState.isSegueActive
            )

        }
        
    }
}

#if DEBUG
struct Groups_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Groups()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS"))
                .previewDisplayName("iPhone XS")
                
            
            Groups()
                .previewDevice(PreviewDevice(rawValue: "iPhone XS Max"))
                .previewDisplayName("iPhone XS Max")

            Groups()
                .previewDevice(PreviewDevice(rawValue: "iPhone Xr"))
                .previewDisplayName("iPhone Xr")
        }
        .environmentObject(UIStateModel())
        .environmentObject(CheckListModel())
    }
}
#endif
