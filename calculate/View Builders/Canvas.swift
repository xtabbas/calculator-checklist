//
//  Canvas.swift
//  calculate
//
//  Created by xtabbas on 8/2/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import Foundation
import SwiftUI

// MARK: Canvas
/// A top level view with a background
struct Canvas<Content : View> : View {
    let content: Content
    
    @inlinable init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        VStack {
            content
        }
        .background(dark.edgesIgnoringSafeArea(.all))
        .frame(width: UIScreen.main.bounds.width)
    }
}
