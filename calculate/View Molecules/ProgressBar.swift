//
//  ProgressBar.swift
//  calculate
//
//  Created by xtabbas on 7/18/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI

struct ProgressBar: View {
    var progress: CGFloat
    
    var body: some View {
        VStack(spacing: 5.0) {
            
            HStack(spacing: 0) {
                Spacer()
                Text("\(Int(progress))")
                    .font(regular18)
                    .foregroundColor(secondary)
                    .fixedSize()
                    .animation(bouncy)
                
                Text(" %")
                    .font(regular18)
                    .foregroundColor(secondary)
                    .fixedSize()
            }
            
            VStack(alignment: .leading) {
                ZStack {
                    Rectangle()
                        .frame(height: 5)
                        .foregroundColor(.black)
                        .opacity(0.5)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                        )
                    
                    GeometryReader { geometry in
                        
                        
                        Rectangle()
                        .frame(height: 5)
                        .foregroundColor(secondary)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .size(CGSize(width: ((geometry.size.width / 100) * self.progress), height: 5))
                            
                        )
                    }
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#if DEBUG
struct ProgressBar_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            Groups()
                .environmentObject(UIStateModel())
                .environmentObject(CheckListModel())
            
            ProgressBar(progress: 25)
                .environmentObject(CheckListModel())
                .background(dark)
            
        }
        
    }
}
#endif
