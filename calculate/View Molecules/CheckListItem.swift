//
//  CheckListItem.swift
//  calculate
//
//  Created by Touq on 8/11/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI

struct CheckListItem : View {
    @EnvironmentObject var checkList: CheckListModel
    @EnvironmentObject var UIState: UIStateModel
    
    var item: Calculation

    @Binding var isExpanded: Bool
    @Binding var isEditing: Bool
    var calculationIndex: Int

    var body: some View {
        return HStack(alignment: .center) {
            Image("cross")
                .foregroundColor(background3)
                .animation(immediate)
                .frame(width: 35, height: 35)
                .onTapGesture {
                    self.checkList.removeById(id: self.item.id)
                }

            if isExpanded {
                Button(action: {
                    self.UIState.editingIndex = self.calculationIndex
                    self.isEditing.toggle()
                }) {
                    Text(item.name != "" ? "\(item.name)" : "Add a name")
                        .font(regular18)
                        .foregroundColor(item.name != "" ? background5 : background3)
                        .padding(.leading, 15)

                }
                .modifier(AddANameAnimation(calculationIndex: calculationIndex))
            }


            Spacer()
            Text(item.value)
                .font(regular18)
                .kerning(0.78)
                .foregroundColor(.white)
                .padding(.trailing, isExpanded ? 30 : 40)

            if isExpanded {
                Button(action: { self.checkList.items[self.calculationIndex].isChecked.toggle() }) {
                    ZStack {
                        ZStack {
                            Circle()
                                .frame(width: 27, height: 27)
                                .foregroundColor(background3)

                            Circle()
                                .frame(width: 25, height: 25)
                                .foregroundColor(background1)



                        }.overlay(
                            ZStack {
                                Circle()
                                    .frame(width: 27, height: 27)
                                    .foregroundColor(primary)
                                Image("tick")
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.black)
                            }
                            .offset(y: item.isChecked ? 0 : 30)
                            .opacity(item.isChecked ? 1 : 0)
                            .animation(bouncy)
                        )


                    }
                }
                .padding(.leading, 10)
                .modifier(ListItemCheckboxAnimation(calculationIndex: calculationIndex))
            }
        }
        .frame(height: isExpanded ? 4 * 9 : 2 * 9)
        .padding(.vertical, isExpanded ? 3 * 9 : 1 * 9)
//        .modifier(ListItemAnimation(isExpanded: $isExpanded))
    }
}

#if DEBUG
struct CheckListItem_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
            .environmentObject(UIStateModel())
            .environmentObject(CheckListModel())
    }
}
#endif
