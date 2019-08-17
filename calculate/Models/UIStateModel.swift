//
//  AppState.swift
//  calculate
//
//  Created by xtabbas on 8/2/19.
//  Copyright © 2019 Abbas, T. All rights reserved.
//

import Foundation

public class UIStateModel: ObservableObject {
    @Published var isSegueActive: Bool = false
    @Published var isChecking: Bool = false
    
    @Published var inputValue: Array<Character> = []
    @Published var editingIndex: Int = 0
}

let stub = [Calculation(value: "900"), Calculation(value: "300")]

public class CheckListModel: ObservableObject {
    @Published var items: [Calculation] = []
    
    func removeById(id: String) {
        var calculationIndex: Int {
            items.firstIndex(where: { $0.id == id })!
        }
        
        items.remove(at: calculationIndex)
    }
    
    func updateByIndex(index: Int, name: String) {
        items[index].name = name
    }
}

struct Calculation: Decodable, Hashable, Identifiable {
    var id: String = UUID().uuidString
    var value: String
    var isChecked: Bool = false
    var name: String = ""
}
