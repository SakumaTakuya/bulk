//
//  MenuDecisionView.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftUI
import SwiftData

struct MenuDecisionView: View {
    @Environment(\.modelContext) private var modelContext
    @State var searchTerm = ""
    @State var menu: Menu? = nil
    var items : [Menu] = []
    
    var body: some View {
        NavigationStack {
            MenuSelectView(searchTerm: searchTerm) { menu in
                    // TODO: セット入力ページに移動する
            }
                .searchable(text: $searchTerm)
                .navigationTitle(String(localized: "menu"))
                .toolbar{
                    ToolbarItem(
                        placement: .navigationBarTrailing
                    ){
                        NavigationLink{
                            MenuAddView()
                        }label:{
                            //ボタンの名前
                            Text("add")
                        }
                    }
                }
        }
    }
}

#Preview {
    MenuDecisionView()
        .modelContainer(for: Record.self, inMemory: true)
}
