//
//  Keyboard.swift
//  calculate
//
//  Created by xtabbas on 7/18/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI
import Foundation

struct Border: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(lineWidth: 1)
                    .foregroundColor(background2)
        )
    }
}

// MARK: Divider Buttons
struct DividerButtons : View {
    let width: CGFloat = 150
    
    @EnvironmentObject var UIState: UIStateModel

    var body: some View {
        return HStack {
            Button(action: {}) {
                Text("[")
                    .foregroundColor(primary)
            }
            .frame(height: 31)
            .frame(width: width)
            .modifier(Border())
            
            Button(action: {}) {
                Text("]")
                    .foregroundColor(primary)
            }
            .frame(height: 31)
            .frame(width: width)
            .modifier(Border())
        }
    }
}

// MARK: Button View
struct ButtonView : View {
    var text : String
    @Binding var value: Array<Character>
    
    var body: some View {
        Button(action: {
            if (self.value.count <= 9) {
                self.value.append(Character(self.text))
            }
            
        }) {
            ZStack {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(background1)

                Text(text)
                    .foregroundColor(.white)
                    .font(semibold24)
            }
        }
    }
}


// MARK: Buttons
struct Buttons : View {
    @EnvironmentObject var checkList: CheckListModel
    
    @Binding var value: Array<Character>
    
    let hSpacing: CGFloat = 15
    
    var body: some View {
        return VStack(spacing: 15.0) {
            
            HStack(spacing: hSpacing) {
                VStack(spacing: 15) {
                    ButtonView(text: "7", value: $value)
                    ButtonView(text: "4", value: $value)
                    ButtonView(text: "1", value: $value)
                }
                
                VStack(spacing: 15) {
                    ButtonView(text: "8", value: $value)
                    ButtonView(text: "5", value: $value)
                    ButtonView(text: "2", value: $value)
                }
                
                VStack(spacing: 15) {
                    ButtonView(text: "9", value: $value)
                    ButtonView(text: "6", value: $value)
                    ButtonView(text: "3", value: $value)
                }
                
                VStack(spacing: 15) {
                    Image("divide")
                        .frame(width: 50, height: 50)
                        .background(primary)
                        .cornerRadius(50)
                    
                    Image("plus")
                        .frame(width: 50, height: 115)
                        .background(primary)
                        .cornerRadius(50)
                }
                
                VStack(spacing: 15) {
                    Image("multiply")
                        .frame(width: 50, height: 50)
                        .background(primary)
                        .cornerRadius(50)
                    
                    Image("minus")
                        .frame(width: 50, height: 50)
                        .background(primary)
                        .cornerRadius(50)
                    
                    Image("divide")
                        .frame(width: 50, height: 50)
                        .background(primary)
                        .cornerRadius(50)
                }
            }
            
            HStack(spacing: hSpacing) {
                
                ButtonView(text: "0", value: $value)
                ButtonView(text: ".", value: $value)
                
                Image("delete")
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                
                
                Button(action: {
                    
                    if self.value.count > 0 {
                        // TODO: calculate bodmas before adding to list
                        self.checkList.items.append(Calculation(value: String(self.value)))
                        
                        self.value = []
                    }
                }) {
                    Image("return")
                        .frame(width: 116, height: 50)
                        .background(secondary)
                        .cornerRadius(50)
                        .foregroundColor(dark)
                }
                .disabled(self.value.count < 1)
                
                
            }
            .frame(minWidth:0, maxWidth: .infinity)
        }
    }
}

#if DEBUG
struct Buttons_Previews : PreviewProvider {
    static var previews: some View {
        VStack {
            DividerButtons()
            Buttons(value: .constant([Character("1")]))
        }
        .background(background1)
    }
}
#endif
