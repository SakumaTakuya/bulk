//
//  MenuDecisionView.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftUI
import SwiftData


//struct MenuDecisionView: View {
//    @Environment(\.modelContext) private var modelContext
//    @Query private var menus: [Menu]
//    @Query private var records: [Record]
//    
//    @State var searchTerm = ""
//    @State var recordBase: Record? = nil
//    var items : [Menu] = []
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                ForEach(menus) { menu in
//                    NavigationLink {
//                        Text("test")
//                    } label: {
//                        Text(menu.name)
//                    }
//                }
//            }
//            .searchable(text: $searchTerm)
//            .onChange(of: searchTerm) {
//                if searchTerm.count > 0 {
//                    _menus = Query(filter: #Predicate<Menu> {
//                        $0.name.contains(searchTerm)
//                    }, sort: \.name,
//                    animation: .easeInOut)
//                    
//                    _records = Query(filter: #Predicate<Record> {
//                        $0.menu.name.contains(searchTerm)
//                    }, sort: \.date,
//                    animation: .easeInOut)
//
//                } else {
//                    _menus = Query(sort: \Menu.name, animation: .easeInOut)
//                    _records = Query(sort: \Record.date, animation: .easeInOut)
//                }
//            }
//        }
//    }
//}

struct MenuDecisionView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isPresentWorkout = false
    @State var searchTerm = ""
    @State var recordBase: Record? = nil
    var items : [Menu] = []
    
    var body: some View {
        NavigationStack {
            RecordBaseSelectView(searchTerm: searchTerm) { selected in
                isPresentWorkout = true
                recordBase = selected
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
            .navigationDestination(isPresented: $isPresentWorkout) {
//                let name = recordBase?.menu.name ?? ""
//                Text(name)
                Text("name")
            }
        }
    }
}

#Preview {
    MenuDecisionView()
        .modelContainer(for: Record.self, inMemory: true)
}
