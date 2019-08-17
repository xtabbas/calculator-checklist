////
////  Pages.swift
////  calculate
////
////  Created by xtabbas on 7/19/19.
////  Copyright © 2019 Abbas, T. All rights reserved.
////
//
//import SwiftUI
//
//struct Pages : View {
//    @State var name: String = ""
//    @State var items: [String] = []
//    @State var listHeight = 0
//    @State var opacity: Double = 0.0
//    @State var value: Array<Character> = []
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
//    @State var backbuttonOpacity: Double = 0.0
//    @State var backbuttonOffset: CGFloat = 0.0
//    
//    @State var thirdScreen: Bool = false
//    
//    @State var thirdScreenOffset: CGFloat = UIScreen.main.bounds.width
//    
////    @State var itemName: String
//    
//    var letsCheckViews: some View {
//        return VStack {
//            HStack(spacing: 0.0) {
//                VStack(alignment: .leading, spacing: 0.0) {
//                    Text("Dont get too lazy!")
//                        .font(regular20)
//                        .foregroundColor(background3)
//                        .padding(.all, 0)
//                    Text("start now!")
//                        .font(regular40)
//                        .foregroundColor(background4)
//                        .padding(.all, 0)
//                        .offset(y: -10)
//                }
//                .frame(height: 6 * 9)
//                    .padding(.top, 6 * 9)
//                    .padding(.bottom, 4 * 9)
//                    .opacity(self.opacity2)
//                    .onAppear() {
//                        withAnimation(placeholder1) {
//                            self.opacity2 = 1
//                        }
//                }
//                .onDisappear() {
//                    self.opacity2 = 0
//                }
//                
//                Spacer()
//            }
//            .padding(.horizontal, 37)
//            
//            ProgressBar()
//                .padding(.horizontal, 37)
//                //                            .frame(height: 6 * 9)
//                .padding(.vertical, 1)
//                //                            .frame(minHeight: letsCheck ? 6 * 9 : 0)
//                .opacity(self.opacity3)
//                .onAppear() {
//                    withAnimation(placeholder2) {
//                        self.opacity3 = 1
//                    }
//            }
//            .onDisappear() {
//                self.opacity3 = 0
//            }
//        }
//    }
//    
//    var page1: some View {
//        return VStack {
//            // MARK: Lets Check Views
//            if (letsCheck == true) {
//                
//                letsCheckViews
//            }
//            
//            // MARK: ItemsList View
//            ItemsList(items: $items, letsCheck: $letsCheck, thirdScreen: $thirdScreen)
////                .padding(.horizontal, 37)
//            
//            // MARK: Text Input
//            HStack(alignment: .center) {
//                Spacer()
//                Text(String(value))
//                    .foregroundColor(.white)
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
//                .padding(.horizontal, 37)
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
//        }
//    }
//    
//    var body: some View {
//        
//        VStack {
//            
//            VStack {
//                // MARK: Tabs View
//                TabsView(letsCheck: $letsCheck)
//                    .padding(.bottom, 4 * 9)
//                    .padding(.top, 2 * 9)
//                    .offset(y: thirdScreen ? -200 : 0)
//                    .frame(height: thirdScreen ? 30 : 100)
//                    .animation(immediate)
//                
//                if thirdScreen {
//                    HStack {
//                        Button(action: { self.thirdScreen.toggle() }) {
//                            Image("arrow")
//                                .frame(width: 30, height: 30)
//                                .rotationEffect(Angle(degrees: 180))
//                                .opacity(backbuttonOpacity)
//                                .offset(x: backbuttonOffset)
//                                .foregroundColor(primary)
//                                .padding(.leading, -10)
//                        }
//                        Spacer()
//                    }
//                    .onAppear() {
//                        withAnimation(placeholder2) {
//                            self.backbuttonOpacity = 1
//                            self.backbuttonOffset = 0
//                        }
//                    }
//                    .onDisappear() {
//                        self.backbuttonOpacity = 0
//                        self.backbuttonOffset = 50
//
//                    }
//                }
//                
//                
//                Spacer()
//                
//                // MARK: Total View
//                TotalView(items: $items, letsCheck: $letsCheck, thirdScreen: $thirdScreen)
//                    .padding(.top, 2 * 9)
//                    .offset(y: self.items.count < 3 ? -CGFloat((0 + (1 * self.items.count)) * 9) : -CGFloat(2 * 9))
//                    .animation(immediate)
//
//            }
//            .padding(.horizontal, 100)
//            .frame(width: UIScreen.main.bounds.width)
//            
//            
//            
//            ZStack {
//
//                VStack {
//                    page1
//                }
//                .frame(minWidth: CGFloat(0), maxWidth: .infinity)
//                .offset(x: thirdScreen ? -UIScreen.main.bounds.width : 0)
//
//                VStack {
//                    if thirdScreen {
//                        VStack {
//                            VStack(spacing: 5.0) {
//                                HStack(alignment: .center, spacing: 5.0) {
//                                    Rectangle()
//                                        .frame(width: 2, height: 30)
//                                        .foregroundColor(background2)
//                                        .padding(.horizontal, 0)
//                                        .offset(y: 2)
//                                        .opacity(opacity)
//                                        .onAppear() {
//                                            withAnimation(repeatingAnimation) {
//                                                self.opacity = 1.0
//                                            }
//                                    }
//                                    Text("item name")
//                                        .font(regular30)
//                                        .foregroundColor(background3)
//                                    Spacer()
//                                }
//                                Rectangle()
//                                    .frame(height: 1)
//                                    .foregroundColor(background2)
//                                
//                                
//                                HStack {
//                                    Spacer()
//                                    Text("Your Item Price =")
//                                        .foregroundColor(background3)
//                                        .font(regular16)
//                                    Text("90")
//                                        .foregroundColor(.white)
//                                        .font(regular18)
//                                    
//                                }
//                            }
//                            
//                            HStack {
//                                Spacer()
//                                
//                                ZStack {
//                                    RoundedRectangle(cornerRadius: 20)
//                                        .foregroundColor(primary)
//                                        .frame(width: 90, height: 30)
//                                    
//                                    Text("SAVE")
//                                        .foregroundColor(background2)
//                                        .font(bold14)
//                                }
//                            }
//                            .padding(.vertical, 15)
//                        }
//                        .padding(.horizontal, 37)
//                        .offset(y: -75)
//                        .onAppear() {
//                            withAnimation() {
//                                self.thirdScreenOffset = 0
//                            }
//                        }
//                        .onDisappear() {
//                            self.thirdScreenOffset = UIScreen.main.bounds.width
//                        }
//                    }
//                    
//                }
//                .frame(minWidth: CGFloat(0), maxWidth: .infinity)
//                .frame(minHeight: 0, maxHeight: .infinity)
//                .offset(x: thirdScreenOffset)
////                .animation(Animation.basic().delay(0.3))
//
//            }
//            .frame(width: UIScreen.main.bounds.width)
//        }
//        .background(background1.edgesIgnoringSafeArea(.all))
//    }
//
//}
//
//
//#if DEBUG
//struct Pages_Previews : PreviewProvider {
//    static var previews: some View {
//        Pages()
//    }
//}
//#endif
