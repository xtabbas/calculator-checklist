//
//  Total.swift
//  calculate
//
//  Created by xtabbas on 7/18/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI

struct GrandTotal : View {
    @EnvironmentObject var UIState: UIStateModel
    @EnvironmentObject var checkList: CheckListModel
    
    @Binding var collapsed: Bool
    
    var body: some View {
        let intArray: [Double] = self.checkList.items.map { Double($0.value)!}
        
        return HStack {
            if UIState.isChecking == false {
                Spacer()
            }
            
            VStack(alignment: UIState.isChecking ? .leading : .trailing, spacing: collapsed ? 5 : -20) {
                
                Text("MY TRIP TO SPAIN")
                    .font(semibold14)
                    .foregroundColor(.white)
                    .kerning(0.12)
                
                if !collapsed {
                    HStack(alignment: .center, spacing: 5) {
                        if !UIState.isChecking {
                            Text("US $")
                                .foregroundColor(.white)
                                .font(regular20)
                        }
                        
                        Text(String(intArray.reduce(0.00, +).kmFormatted))
                            .foregroundColor(.white)
                            .font(regular90)
                            .kerning(0)
                            .lineLimit(1)
                            .offset(x: 3)
                    }
                    .fixedSize()
                }
                
                
                
                Rectangle()
                    .frame(width: 44, height: 3)
                    .foregroundColor(primary)
                
            }
            .animation(immediate.speed(2))
            .padding(.horizontal, 35)
            
            if UIState.isChecking == true {
                Spacer()
            }
        }
        .offset(
            y:
            self.checkList.items.count < 3 ?
                -CGFloat((0 + (1 * self.checkList.items.count)) * 9) :
                -CGFloat(2 * 9)
        )
    }
}

struct Total_Animation: ViewModifier {
    @State private var height: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .frame(minHeight: 0, maxHeight: .infinity)
            .onAppear() {
                withAnimation(Animation.spring().speed(10)) {
                    self.height = .infinity
                }
            }
            .onDisappear() {
                self.height = 0
            }
    }
}

extension Double {
    var kmFormatted: String {

        if self >= 10000, self <= 999999 {
            return String(format: "%.1fK", locale: Locale.current,self/1000).replacingOccurrences(of: ".0", with: "")
        }

        if self > 999999, self <= 99999999 {
            return String(format: "%.1fM", locale: Locale.current,self/1000000).replacingOccurrences(of: ".0", with: "")
        }
        
        if self > 99999999 {
            return String(format: "%.1fB", locale: Locale.current,self/1000000000).replacingOccurrences(of: ".0", with: "")
        }

        return String(format: "%.0f", locale: Locale.current,self)
    }
}

#if DEBUG
struct GrandTotal_Previews : PreviewProvider {
    static var previews: some View {
        Group {
//            GrandTotal(collapsed: .constant(false))
//                .background(dark)
            Groups()
        }
        .environmentObject(UIStateModel())
        .environmentObject(CheckListModel())
    }
}
#endif
