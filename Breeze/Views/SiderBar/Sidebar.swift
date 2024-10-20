import SwiftUI

struct Sidebar: View {
    @Binding var ListCategories: [ListCategory]
    @Binding var selection: JobStatus
    
    var body: some View {
        List(selection: $selection) {
            ForEach(ListCategories) { category in
                HStack {
                    Text(category.name)
                        .foregroundStyle(
                            selection == JobStatus.list(category) ? Color.black: Color.white)
                        .font(.system(size: 16))
                    Spacer()
                    Button(action: {
                        print(selection)
                    }, label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(
                                selection == JobStatus.list(category) ? Color.black: Color.white)
                    })
                    .buttonStyle(NoBackgroundButtonStyle())
                }
                .listRowBackground(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(
                    selection == JobStatus.list(category) ? Color.white : Color.clear
                    )
                )
                
                .padding(.horizontal, 5)
                .padding(.vertical)
                .tag(JobStatus.list(category))
            }
            .onMove { from, to in
                ListCategories.move(fromOffsets: from, toOffset: to)
            }
        }
        .listStyle(SidebarListStyle())
        .frame(minWidth: 200, idealWidth: 225, maxWidth: 300)
    }
    
}

#Preview {
    Sidebar(ListCategories: .constant(previewExamples.examples()), selection: .constant(JobStatus.list(previewExamples.examples()[1])))
}
