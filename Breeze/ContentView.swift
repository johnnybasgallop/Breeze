import SwiftUI

struct ContentView: View {
    @State var selected = "item1"
    let ListCategories : [ListCategory]
    @State private var Selection = JobStatus.todo
    
    var body: some View {
        ZStack {
            VisualEffectBlurView()
            
            // Overlay a semi-transparent black color for the smoky look
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            // Your content goes here
            VStack {
                NavigationSplitView {
                    Sidebar(ListCategories: ListCategories, selection: $Selection )
                } detail: {
                    switch Selection {
                    case .todo:
                        Text("Todo")
                    case .inProgress:
                        Text("Todo")
                    case .done:
                        Text("Todo")
                    case .list(let listCat):
                        TaskView(Jobs: listCat.jobs)
                    }
                }

            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    ContentView(ListCategories: [ListCategory.example(generalTitle: "General Chores", fakeJobName: "Take out the bins"), ListCategory.example(generalTitle: "Homework", fakeJobName: "Begin studying for AP final")])
}
