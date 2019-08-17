////
////  ItemsList.swift
////  calculate
////
////  Created by xtabbas on 7/18/19.
////  Copyright © 2019 Abbas, T. All rights reserved.
////
//
//import SwiftUI
//
//struct CheckList : View {
//    @EnvironmentObject var checkList: CheckListModel
//    @EnvironmentObject var UIState: UIStateModel
//    
//    var body: some View {
//        let contentSize = CGFloat((4 + (self.checkList.items.count * 4)) * 9)
//        let scrollHeight = self.checkList.items.count < 3 ? CGFloat(contentSize) : CGFloat(12*9)
//
//        let offsetY = contentSize - scrollHeight - (4*9)
//            
//        return ScrollView(.vertical, showsIndicators: false) {
//            VStack(spacing: 0) {
//
//                ForEach(self.checkList.items, id: \.self.id) { item in
//                    CheckListItem(
//                        item: item,
//                        calculationIndex: self.checkList.items.firstIndex(where: { $0.id == item.id })!
//                    )
//                }
//
//                if self.checkList.items.count < 1 {
//                    Rectangle()
//                }
//            }
//            .offset(y: UIState.isChecking ? 0 : -offsetY)
//
//        }
//        .frame(height: UIState.isChecking ? 30 * 9 : scrollHeight + (6*9))
//        .padding(.vertical, 0)
//    }
//}
//
//#if DEBUG
//struct CheckList_Previews: PreviewProvider {
//    static var previews: some View {
//        Groups()
//            .environmentObject(UIStateModel())
//            .environmentObject(CheckListModel())
//    }
//}
//#endif
