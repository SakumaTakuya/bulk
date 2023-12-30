//
//  RecordableToggle.swift
//  bulk
//
//  Created by sakuma.takuya on 2023/12/30.
//

import SwiftUI

struct RecordableToggle: View {
    @Binding var set: Set<Recordable>
    let target: Recordable
    @State private var isOn: Bool = false
    
    var body: some View {
        Toggle(LocalizedStringKey(target.rawValue), isOn: $isOn)
            .onChange(of: isOn) { old, new in
                if (!old && new) {
                    set.insert(target)
                }
                
                if (old && !new) {
                    set.remove(target)
                }
            }
    }
}

struct RecordableToggle__Preview: View {
    @State var test: Set<Recordable> = []
    
    var body: some View {
        return List {
            RecordableToggle(set: $test, target: .rest)
            RecordableToggle(set: $test, target: .time)
            RecordableToggle(set: $test, target: .reps)
            
            
            let sorted = test.sorted {
                $0.rawValue < $1.rawValue
            }
            ForEach(sorted, id: \.self) { recordable in
                Text(recordable.rawValue)
            }
        }
    }
}

#Preview {
    RecordableToggle__Preview()
}
