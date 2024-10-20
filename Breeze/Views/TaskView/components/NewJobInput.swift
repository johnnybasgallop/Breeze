import SwiftUI

struct NewJobInput: View {
    @State private var text: String = ""
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.5))
                .frame(maxWidth: .infinity)
                .frame(height: 50)
            
            Button(action: {
                isPresented.toggle()
            }, label: {
                HStack{
                    Text("Add new job")
                    Spacer()
                    Image(systemName: "plus")
                }
                .padding()
            }
            ).clipShape(RoundedRectangle(cornerRadius: 10))
            
        }
    }
}


#Preview {
    NewJobInput(isPresented: .constant(false))
}
