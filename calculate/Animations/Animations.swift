//
//  Animations.swift
//  calculate
//
//  Created by xtabbas on 8/7/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI

// MARK: Animations
var repeatingAnimation = Animation.spring().repeatForever()
var delayAnimation = Animation.spring().delay(0.8)

var immediate = Animation.spring()

var bouncy = Animation.interactiveSpring(response: 1, dampingFraction: 0.5, blendDuration: 1).speed(3)
//var bouncy2 = Animation.interactiveSpring(response: 1, dampingFraction: 1, blendDuration: 1).speed(3)

var delayed1 = Animation.spring().delay(0.1)
var delayed2 = Animation.spring().delay(0.2)
var delayed3 = Animation.spring().delay(0.3)
var delayed4 = Animation.spring().delay(0.4)
var delayed5 = Animation.spring().delay(0.5)
var delayed6 = Animation.spring().delay(0.6)
var delayed7 = Animation.spring().delay(0.6)
var delayed8 = Animation.spring().delay(0.6)

struct FirstScreen_Animation: ViewModifier {
    func body(content: Content) -> some View {
        content
            .animation(Animation.spring())
    }
}

struct SecondScreen_Animation: ViewModifier {
    @State private var offset: CGFloat = UIScreen.main.bounds.width
    
    func body(content: Content) -> some View {
        content
            .offset(x: offset, y: 0)
            .onAppear() {
                withAnimation(Animation.spring().delay(0.3)) {
                    self.offset = 0
                }
            }
            .onDisappear() {
                self.offset = UIScreen.main.bounds.width
            }
    }
}

struct AddANameAnimation: ViewModifier {
    @State var opacity: Double = 0
    
    var calculationIndex: Int
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .onAppear() {
                withAnimation(
                    self.calculationIndex == 0 ?
                        Animation.spring().delay(0.5).speed(2) :
                        self.calculationIndex == 0 ?
                        Animation.spring().delay(0.4).speed(2) :
                        Animation.spring().delay(0.4).speed(2)
                    ) {
                    self.opacity = 1.0
                }
            }
            .onDisappear() {
                self.opacity = 0
            }
    }
}


struct ListItemAnimation: ViewModifier {
    @State var offset: Double = 20
    @Binding var isExpanded: Bool
    
    func body(content: Content) -> some View {
        content
//            .animation(Animation.linear(duration: 0.3))
            .offset(x: 0, y: CGFloat(offset))
            .onAppear() {
                withAnimation(bouncy) {
                    self.offset = 0
                }
            }
            .onDisappear() {
                self.offset = 40
            }
    }
}

struct ListItemCheckboxAnimation: ViewModifier {
    @State var offset: Double = 0
    @State var width: CGFloat = 0
    
    var calculationIndex: Int
    
    func body(content: Content) -> some View {
        content
            .offset(x: CGFloat(offset), y: 1)
            .frame(minWidth: 0, maxWidth: width)
            .onAppear() {
                withAnimation(
                    self.calculationIndex == 0 ?
                        Animation.spring().delay(0.5).speed(2) :
                        self.calculationIndex == 0 ?
                        Animation.spring().delay(0.4).speed(2) :
                        Animation.spring().delay(0.4).speed(2)
                    ) {
                    self.offset = -35
                    self.width = 40
                }
            }
            .onDisappear() {
                self.offset = 0
                self.width = 0
            }
    }
}


struct ProgressSpur_Animation: ViewModifier {
    @State var opacity: Double = 0
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .onAppear() {
                withAnimation(delayed2) {
                    self.opacity = 1.0
                }
            }
            .onDisappear() {
                self.opacity = 0
            }
    }
}

struct ProgressBar_Animation: ViewModifier {
    @State var opacity: Double = 0
    
    func body(content: Content) -> some View {
        content
            .opacity(opacity)
            .onAppear() {
                withAnimation(Animation.linear(duration: 0.2).delay(0.6)) {
                    self.opacity = 1.0
                }
            }
            .onDisappear() {
                self.opacity = 0
            }
    }
}

#if DEBUG
struct SecondScreen_Animation_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
            .environmentObject(UIStateModel())
            .environmentObject(CheckListModel())
    }
}
#endif
