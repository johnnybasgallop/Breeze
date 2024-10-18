import SwiftUI

struct ContentView: View {
    @State var selected = "item1"
    @State private var ListCategories : [ListCategory] = [ListCategory.example(generalTitle: "General Chores", fakeJobName: "Take out the bins"), ListCategory.example(generalTitle: "Homework", fakeJobName: "Begin studying for AP final")]
    
    @State private var Selection = JobStatus.todo
    
    var body: some View {
        ZStack {
            VisualEffectBlurView()
            
            // Overlay a semi-transparent black color for the smoky look
            Color.black.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            NavigationSplitView {
                Sidebar(ListCategories: $ListCategories, selection: $Selection )
            } detail: {
                switch Selection {
                case .todo:
                    Text("Select a job to see relevant tasks")
                case .inProgress:
                    Text("Select a job to see relevant tasks")
                case .done:
                    Text("Select a job to see relevant tasks")
                case .list(let listCat):
                    TaskView(Jobs: listCat.jobs)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
