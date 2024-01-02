//
//  RecordBaseSelectView.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/12/31.
//

import SwiftUI
import SwiftData

struct RecordBaseSelectView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Menu.name, order: .forward)
    private var menus: [Menu]
    @Query(sort: \Record.menu?.name, order: .forward)
    private var records: [Record]
    var onSelect: (Record) -> Void

    init(searchTerm: String, onSelect: @escaping (Record) -> Void) {
        if searchTerm.count > 0 {
            _menus = Query(filter: #Predicate<Menu> {
                $0.name.contains(searchTerm)
            }, sort: \.name,
            animation: .easeInOut)
            
            _records = Query(filter: #Predicate<Record> {
                $0.menu?.name.contains(searchTerm) ?? false
            }, sort: \.date,
            animation: .easeInOut)

        } else {
            _menus = Query(sort: \Menu.name, animation: .easeInOut)
            _records = Query(sort: \Record.date, animation: .easeInOut)
        }
        
        self.onSelect = onSelect
    }

    var body: some View {
        List {
            ForEach(menus) { menu in
                Button(menu.name) {
                    let newRecord = Record(
                        sets: [],
                        date: .now
                    )
                    menu.records.append(newRecord)
                    onSelect(newRecord)
                }
            }
            ForEach(records) { record in
                Button(record.menu?.name ?? "") {
                    onSelect(record)
                }
            }
        }
    }
}

#Preview {
    RecordBaseSelectView(searchTerm: "test", onSelect: {_ in })
        .modelContainer(for: [Record.self, Menu.self], inMemory: true) { result in
            switch result {
            case .success(let container):
                for i in 1..<10 {
                    let part = BodyPart("part")
                    let menu = Menu(name: "test\(i)", recordables: [.reps])
                    let record = Record(sets: [], date: .now)
                    
                    container.mainContext.insert(part)
                    container.mainContext.insert(menu)
                    container.mainContext.insert(record)
                    
                    part.menus.append(menu)
                    menu.records.append(record)
                }
                try! container.mainContext.save()
            case .failure:
                break
            }
        }
}
