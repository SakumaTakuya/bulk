import SwiftUI

struct Content: View {
  @State var searchText: String = ""
  @State var dogType: DogType = .all
  @State var searchHistory: [String] = ["choco", "kinako", "malon"]
  
  let dogs: [Dog] = [
    .init(name: "mugi", color: .orange, type: .poodle),
    .init(name: "mugi", color: .red, type: .chihuahua),
    .init(name: "coco", color: .blue, type: .poodle),
    .init(name: "malon", color: .brown, type: .chihuahua),
    .init(name: "moco", color: .green, type: .poodle),
    .init(name: "comugi", color: .pink, type: .chihuahua),
  ]
  
  var matchedDogs: [Dog] {
    if searchText.isEmpty {
      return dogs
    }
    
    if dogType == .all {
      return dogs.filter { $0.name.contains(searchText) }
    }
    
    return dogs.lazy
      .filter { $0.type == dogType }
      .filter { $0.name.contains(searchText) }
  }
  
  var body: some View {
    NavigationStack {
      List(matchedDogs) { dog in
        DogCell(dog: dog)
      }
      .navigationTitle("All Dogs")
      .searchable(text: $searchText) {
          EmptyView()
      }
      .searchScopes($dogType) {
        ForEach(DogType.allCases) { type in
          Text(type.rawValue).tag(type)
        }
      }
      .searchSuggestions {
        if searchText.isEmpty && !searchHistory.isEmpty {
          Section("History") {
            ForEach(searchHistory, id: \.self) { history in
              Label(history, systemImage: "clock.arrow.circlepath")
                .searchCompletion(history)
                .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                  Button(role: .destructive) {
                    searchHistory.removeAll { $0 == history }
                  } label: {
                    Text("Delete")
                  }
                }
            }
          }
        }

        if !searchText.isEmpty && !matchedDogs.isEmpty {
          Section("Suggest") {
            ForEach(matchedDogs) { dog in
              DogCell(dog: dog)
                .searchCompletion(dog.name)
            }
          }
        }
      }
      .onSubmit(of: .search) {
        if !searchHistory.contains(searchText) {
          searchHistory.append(searchText)
        }
      }
    }
  }
}

struct DogCell: View {
  let dog: Dog
  
  var body: some View {
    HStack {
      Label(dog.name, systemImage: "pawprint")
      Spacer()
      Text(dog.type.rawValue)
    }
      .foregroundStyle(dog.color)
  }
}

struct Dog: Identifiable {
  let id = UUID()
  let name: String
  let color: Color
  let type: DogType
}

enum DogType: String, CaseIterable, Identifiable {
  case all = "全て"
  case poodle = "プードル"
  case chihuahua = "チワワ"
  
  var id: String { rawValue }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    Content()
  }
}
