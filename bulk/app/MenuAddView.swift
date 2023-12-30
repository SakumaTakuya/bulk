//
//  MenuAddView.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/23.
//

import SwiftUI
import SwiftData

struct MenuAddView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    @Query private var bodyParts: [BodyPart]
    
    @State private var name = ""
    
    @State private var isShowPart = true
    @State private var selectedPart : BodyPart? = nil
    @State private var newPart = ""
    @State private var recordables: Set<Recordable> = []
    
    @State private var text = ""
    @State private var searchTerm = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("name")) {
                    TextField("add menu name", text: $name)
                }
                
                Section(header: Text("body part")) {
                    DisclosureGroup(
                        selectedPart?.name ?? "select",
                        isExpanded: $isShowPart
                    ) {
                        ForEach(bodyParts) { part in
                            Button(part.name) {
                                withAnimation {
                                    selectedPart = part
                                    isShowPart = false
                                }
                            }
                        }
                        HStack {
                            TextField("add body part", text: $newPart)
                            Spacer()
                            Button("add") {
                                if newPart.isEmpty {
                                   return
                                }
                                
                                addBodyPart(
                                    part: BodyPart(newPart)
                                )
                                newPart = ""
                            }
                        }
                    }
                }
                
                Section(header: Text("recordable")) {
                    RecordableToggle(set: $recordables, target: .reps)
                    RecordableToggle(set: $recordables, target: .rest)
                    RecordableToggle(set: $recordables, target: .time)
                    RecordableToggle(set: $recordables, target: .weight)
                }
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(
                        action: {
                            guard let part = selectedPart else {
                                return
                            }
                            modelContext.insert(Menu(
                                name: name,
                                part: part,
                                recordables: Array(recordables)
                            ))
                            dismiss()
                        }, label: {
                            Text("submit")
                        }
                    )
                }
            }
        }
    }
    
    func addBodyPart(part: BodyPart) {
        withAnimation {
            modelContext.insert(part)
        }
    }
}

#Preview {
    MenuAddView()
        .modelContainer(for: [
            Menu.self,
            BodyPart.self
        ], inMemory: true)
}
