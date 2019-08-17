//
//  ItemsList.swift
//  calculate
//
//  Created by xtabbas on 7/18/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI
import UIKit
import Foundation

var scrollViewWidth: NSLayoutConstraint?
var scrollViewHeight: NSLayoutConstraint?
var checkListHeight: NSLayoutConstraint?

var contentInset: CGFloat = 6*9

struct CheckListScroller: UIViewRepresentable {
    @Binding var checkList: [Calculation]
    @Binding var isChecking: Bool
    @Binding var isSegueActive: Bool
    
    func makeUIView(context: UIViewRepresentableContext<CheckListScroller>) -> UIScrollView {
        let scrollView = UIScrollView()
        
        let HostedList = UIHostingController(rootView: ListContainer()).view
        
        scrollView.addSubview(HostedList!)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        scrollViewWidth = scrollView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 35)
        scrollViewHeight = scrollView.heightAnchor.constraint(equalToConstant: 0)
        
        scrollViewWidth?.isActive = true
        scrollViewHeight?.isActive = true
        
        scrollView.backgroundColor = UIColor(named: "dark")
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        HostedList?.translatesAutoresizingMaskIntoConstraints = false
        HostedList?.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        HostedList?.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        HostedList?.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        HostedList?.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 1).isActive = true
        
        checkListHeight = HostedList?.heightAnchor.constraint(equalToConstant: 0)
        checkListHeight?.isActive = true
        
        HostedList?.backgroundColor = UIColor(named: "dark")
        
        return scrollView
    }
    
    func updateUIView(_ scrollView: UIScrollView, context: UIViewRepresentableContext<CheckListScroller>) {
        
        let contentSize = CGFloat((4 + (self.checkList.count * 4)) * 9)
        let scrollHeight = self.checkList.count < 3 ? contentSize : CGFloat(12*9)
        
        if !self.isChecking {
            
            scrollView.contentSize = CGSize(width: scrollView.frame.width, height: contentSize)
            
            if !(self.checkList.count < 3) {
                UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                    scrollView.setContentOffset(CGPoint(x: 0, y: self.checkList.count > 1 ? scrollView.contentSize.height - scrollView.bounds.height : 0), animated: false)
                })
            }
            
            
        }
        
        scrollViewWidth?.isActive = false
        scrollViewWidth?.constant = UIScreen.main.bounds.width - 35
        scrollViewWidth?.isActive = true
        
        scrollViewHeight?.isActive = false
        scrollViewHeight?.constant = self.isChecking ? 30 * 9 : scrollHeight
        scrollViewHeight?.isActive = true
        
        let expandedContentSize = CGFloat((self.checkList.count * 10) * 9)
        
        checkListHeight?.isActive = false
        checkListHeight?.constant = self.isChecking ? expandedContentSize : contentSize
        checkListHeight?.isActive = true
        
    }
    
    typealias UIViewType = UIScrollView
}

struct ListContainer: View {
    @EnvironmentObject var checkList: CheckListModel
    @EnvironmentObject var UIState: UIStateModel

    var body: some View {
        return VStack(spacing: 0) {
            Spacer()
            ForEach(self.checkList.items, id: \.self.id) { item in
                CheckListItem(
                    item: item,
                    isExpanded: self.$UIState.isChecking,
                    isEditing: self.$UIState.isSegueActive,
                    calculationIndex: self.checkList.items.firstIndex(where: { $0.id == item.id })!
                )
            }
        }
    }
}

struct CheckListUIKit : View {
    @EnvironmentObject var checkList: CheckListModel
    @EnvironmentObject var UIState: UIStateModel
    
    var body: some View {
        let contentSize = CGFloat((4 + (self.checkList.items.count * 4)) * 9)
        let scrollHeight = self.checkList.items.count < 3 ? CGFloat(contentSize) : CGFloat(12*9)

        return CheckListScroller(
            checkList: self.$checkList.items,
            isChecking: self.$UIState.isChecking,
            isSegueActive: self.$UIState.isSegueActive
        )
        .frame(height: UIState.isChecking ? 30 * 9 : scrollHeight + contentInset)
            .animation(UIState.isChecking ? Animation.linear(duration: 0.2) : bouncy)
    }
}

#if DEBUG
struct CheckListUIKit_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
            .environmentObject(UIStateModel())
            .environmentObject(CheckListModel())
    }
}
#endif
