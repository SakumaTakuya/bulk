//
//  ContentView.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/11/03.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var items: [Record]

    var body: some View {
        NavigationStack{
            List {
                ForEach(items) { item in
                    Text("test")
                }
            }
            .navigationTitle("record")
            .toolbar{
                ToolbarItem(
                    placement: .navigationBarTrailing
                ){
                    NavigationLink{
                        MenuDecisionView()
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
    ContentView(
//        viewModel: RecordCollectionViewModel()
    )
    .modelContainer(for: Record.self, inMemory: true)
}
