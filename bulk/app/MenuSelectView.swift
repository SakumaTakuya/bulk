//
//  MenuListView.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/23.
//

import SwiftUI
import SwiftData

struct MenuSelectView: View {
    @Query(sort: \Menu.name, order: .forward)
    private var menus: [Menu]
    var onSelect: (Menu) -> Void

    init(searchTerm: String, onSelect: @escaping (Menu) -> Void) {
        if searchTerm.count > 0 {
            self._menus = Query(filter: #Predicate<Menu> {
                $0.name.contains(searchTerm)
            }, sort: \.name,
            animation: .easeInOut)

        } else {
            self._menus = Query(sort: \Menu.name, animation: .easeInOut)
        }
        
        self.onSelect = onSelect
    }

    var body: some View {
        List {
            // TODO: フィルターを追加
            ForEach(menus) { menu in
                Button(menu.name) {
                    onSelect(menu)
                }
            }
        }
    }
}
