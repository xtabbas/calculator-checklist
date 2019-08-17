//
//  TestView.swift
//  calculate
//
//  Created by xtabbas on 8/5/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI

struct TestView : View {
    @State private var isActive: Bool = true
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: DetailView(), isActive: self.$isActive) {
                
                Button(action: { self.isActive.toggle() }) {
                    Text("Hello World")
                }
                
            }
        }.onAppear {
            print("ContentView appeared!")
        }.onDisappear {
            print("ContentView disappeared!")
        }
    }
}

struct DetailView : View {
    var body: some View {
        VStack {
            Text("Second View")
        }.onAppear {
                print("DetailView appeared!")
        }.onDisappear {
                print("DetailView disappeared!")
        }
    }
}

#if DEBUG
struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
#endif
