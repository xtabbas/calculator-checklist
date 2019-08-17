//
//  ListProfile.swift
//  calculate
//
//  Created by xtabbas on 8/3/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import SwiftUI
import UIKit

struct CustomtextField: UIViewRepresentable {
    @Binding var value: String
    @Binding var keyboardShown: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField =  UITextField()
        
        textField.attributedPlaceholder = NSAttributedString(
            string: " item name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "background2") as Any]
        )
        
        textField.textColor = UIColor(named: "background5")
        
        textField.font = UIFont(name: "TitilliumWeb-Regular", size: 30)
        textField.borderStyle = UITextField.BorderStyle.none
        
        textField.tintColor = UIColor(named: "background3")
        
        textField.autocorrectionType = UITextAutocorrectionType.yes
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.delegate = context.coordinator
        
        textField.addTarget(context.coordinator, action: #selector(Coordinator.updateValue(sender:)), for: .editingChanged)
        
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(Coordinator.keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(context.coordinator, selector: #selector(Coordinator.keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        return textField
    }

    func updateUIView(_ textField: UITextField, context: Context) {}
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var textField: CustomtextField

        init(_ textField: CustomtextField) {
            self.textField = textField
        }
        
        @objc
        func updateValue(sender: UITextField) {
            textField.value = sender.text!
        }
        
        @objc
        func keyboardWillAppear() {
            textField.keyboardShown = true
        }

        @objc
        func keyboardWillDisappear() {
            textField.keyboardShown = false
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
    }
}

struct ItemProfile: View {
    @EnvironmentObject var UIState: UIStateModel
    @EnvironmentObject var checkList: CheckListModel
    
    @State var itemName: String = ""
    @State var keyboardShown: Bool = false
    
    var body: some View {
        VStack {
            VStack(spacing: 5.0) {
                Spacer()
                
                CustomtextField(value: self.$itemName, keyboardShown: self.$keyboardShown)
                    .frame(height: 40)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(background2)
                
                
                HStack {
                    Spacer()
                    Text("Your Item Price =")
                        .foregroundColor(background3)
                        .font(regular16)
                    Text(checkList.items[self.UIState.editingIndex].value)
                        .foregroundColor(.white)
                        .font(regular18)
                    
                }
            }
            
            HStack {
                Spacer()
                Button(action: {
                    self.checkList.updateByIndex(index: self.UIState.editingIndex, name: self.itemName)
                    self.UIState.isSegueActive.toggle()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(primary)
                            .frame(width: 90, height: 30)
                        
                        
                        Text("SAVE")
                            .foregroundColor(background2)
                            .font(bold14)
                    }
                }
            }
            .padding(.vertical, 10)
            
        }
        .padding(.horizontal, 37)
        .offset(y: self.keyboardShown ? -75 : 0)
        .animation(bouncy)
    }
}

#if DEBUG
struct ItemProfile_Previews: PreviewProvider {
    static var previews: some View {
        Groups()
            .environmentObject(UIStateModel())
            .environmentObject(CheckListModel())
    }
}
#endif
