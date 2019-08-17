////
////  ContentView.swift
////  calculate
////
////  Created by Touqeer Abbas on 7/16/19.
////  Copyright © 2019 Touqeer Abbas. All rights reserved.
////
//
//import SwiftUI
//
//// MARK: Fonts
//let regular90 = Font.custom("TitilliumWeb-Regular", size: 90)
//let regular18 = Font.custom("TitilliumWeb-Regular", size: 18)
//let regular20 = Font.custom("TitilliumWeb-Regular", size: 20)
//let regular24 = Font.custom("TitilliumWeb-Regular", size: 24)
//let regular28 = Font.custom("TitilliumWeb-Regular", size: 28)
//let regular40 = Font.custom("TitilliumWeb-Regular", size: 40)
//
//let bold14 = Font.custom("TitilliumWeb-Bold", size: 14)
//let bold16 = Font.custom("TitilliumWeb-Bold", size: 16)
//
//let semibold14 = Font.custom("TitilliumWeb-SemiBold", size: 14)
//let semibold24 = Font.custom("TitilliumWeb-SemiBold", size: 24)
//
//// MARK: Colors
//let dark = Color("dark")
//let primary = Color("primary")
//let secondary = Color("secondary")
//let background1 = Color("background1")
//let background2 = Color("background2")
//let background3 = Color("background3")
//let background4 = Color("background4")
//let background5 = Color("background5")
//
//let listItemHeight = CGFloat(30)
//
//
//// MARK: Animations
//var repeatingAnimation = Animation.basic(duration: 0.8).repeatForever()
//var delayAnimation = Animation.basic(duration: 0.8).delay(0.8)
//
//var immediate = Animation.fluidSpring()
//var immediate2 = Animation.spring()
//
//var placeholder6 = Animation.fluidSpring().delay(0.2).speed(1.5)
//var placeholder3 = Animation.fluidSpring().delay(0.25).speed(1.5)
//var placeholder5 = Animation.spring().delay(0.25).speed(1.5)
//var placeholder = Animation.fluidSpring().delay(0.3).speed(1.5)
//var placeholder2 = Animation.spring().delay(0.5).speed(1)
//var placeholder4 = Animation.fluidSpring().delay(0.8).speed(1.5)
//
//
//// MARK: ContentView_Previews
//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
//#endif
//
//// MARK: ContentView
//
//struct ContentView : View {
//    @State var name: String = ""
//    @State var items: [String] = []
//    @State var listHeight = 0
//    @State var opacity: Double = 0.0
//    @State var value: [Character] = []
//    
//    @State var fontSize: Font = regular28
//    @State var opacity1: Double = 1
//    @State var offset: Double = 0
//    
//    @State var letsCheck: Bool = false
//    
//    @State var opacity2: Double = 0.0
//    @State var opacity3: Double = 0.0
//    
//    @State var thirdScreen: Bool = false
//    
//    var body: some View {
//        VStack{
//            // MARK: Tabs View
//            TabsView(letsCheck: $letsCheck)
//                .padding(.bottom, 4 * 9)
//                .padding(.top, 2 * 9)
//            
//            Spacer()
//            
//            // MARK: Total View
//            TotalView(items: $items, letsCheck: $letsCheck)
//                .padding(.top, 2 * 9)
//                .offset(y: self.items.count < 3 ? -CGFloat((0 + (1 * self.items.count)) * 9) : -CGFloat(2 * 9))
//                .animation(immediate)
//            
//            // MARK: Lets Check Views
//            if (letsCheck == true) {
//                
//                HStack {
//                    VStack(alignment: .leading, spacing: 0.0) {
//                        Text("Dont get too lazy!")
//                            .font(regular20)
//                            .color(background3)
//                            .padding(.all, 0)
//                        Text("start now!")
//                            .font(regular40)
//                            .color(background4)
//                            .padding(.all, 0)
//                            .offset(y: -10)
//                    }
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                        .frame(height: 6 * 9)
//                        .padding(.top, 6 * 9)
//                        .padding(.bottom, 4 * 9)
//                        .padding(.horizontal, -5)
//                        .opacity(self.opacity2)
//                        .onAppear() {
//                            withAnimation(placeholder) {
//                                self.opacity2 = 1
//                            }
//                    }
//                    .onDisappear() {
//                        self.opacity2 = 0
//                    }
//                    
//                    Spacer()
//                }
//                
//                ProgressBar()
//                    .frame(minWidth: 0, maxWidth: .infinity)
//                    .frame(height: 6 * 9)
//                    .padding(.vertical, 1)
//                    //                .background(secondary)
//                    
//                    .frame(minHeight: letsCheck ? 6 * 9 : 0)
//                    .opacity(self.opacity3)
//                    .onAppear() {
//                        withAnimation(placeholder4) {
//                            self.opacity3 = 1
//                        }
//                }
//                .onDisappear() {
//                    self.opacity3 = 0
//                }
//            }
//            
//            // MARK: ItemsList View
//            ItemsList(items: $items, letsCheck: $letsCheck)
//            
//            // MARK: Text Input
//            HStack(alignment: .center) {
//                Spacer()
//                Text(String(value))
//                    .color(.white)
//                    .font(fontSize)
//                    .offset(x: 5, y: CGFloat(offset))
//                    .animation(immediate)
//                    .opacity(Double(opacity1))
//                
//                Rectangle()
//                    .frame(width: 2, height: 22)
//                    .foregroundColor(primary)
//                    .padding(.horizontal, 0)
//                    .offset(y: 2)
//                    .opacity(opacity)
//                    .onAppear() {
//                        withAnimation(repeatingAnimation) {
//                            self.opacity = 1.0
//                        }
//                }
//                
//            }
//            .frame(height: 4.5 * 9)
//                .padding(.top, 1 * 9)
//                .padding(.bottom, 0.5 * 9)
//                .offset(y: letsCheck ? 500 : 0)
//                .frame(maxHeight: letsCheck ? 0 : .infinity)
//            
//            
//            // MARK: Divider Buttons
//            DividerButtons()
//                .padding(.top, 1 * 9)
//                .padding(.bottom, 0 * 9)
//                .frame(height: 4.5 * 9)
//                .frame(maxHeight: letsCheck ? 0 : .infinity)
//                .offset(y: letsCheck ? 350 : 0)
//                .opacity(letsCheck ? 0.5 : 1)
//                .animation(placeholder6)
//            
//            // MARK: Keyboard
//            KeyboardView(
//                items: $items,
//                listHeight: $listHeight,
//                value: $value,
//                fontSize: $fontSize,
//                opacity1: $opacity1,
//                offset: $offset
//            )
//                .frame(height: 30 * 9)
//                .padding(.bottom, 0.5 * 9)
//                .offset(y: letsCheck ? 300 : 0)
//                .animation(immediate)
//                .frame(maxHeight: letsCheck ? 0 : .infinity)
//                .animation(delayAnimation)
//            
//        }
//        .padding(.horizontal, 100)
//        .background(background1.edgesIgnoringSafeArea(.all))
//        
//    }
//}
//
