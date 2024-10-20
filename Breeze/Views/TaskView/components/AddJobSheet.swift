//
//  AddJobSheet.swift
//  Breeze
//
//  Created by johnny basgallop on 20/10/2024.
//

import SwiftUI

struct AddJobSheet: View {
    @State private var text : String = ""
    @Binding var isPresented : Bool
    var body: some View {
        VStack(alignment: .leading){
            
            HStack{
                Text("Add new job to Bluefin Automations ")
                    .font(.title).fontWeight(.bold)
                    .lineLimit(nil)
                    .padding(.horizontal)
                    .padding(.top)
             Spacer()
                
            }
            
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.8))
                    .frame(maxWidth: .infinity)
                    .frame(height: 50)
                TextField("Enter job name...",text: $text)
                    .foregroundStyle(.white)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding()
                    
            }
            .padding()
            
            Button(action: {
                
            }, label: {
                HStack(alignment: .center, spacing: 5){
                    Image(systemName: "plus").font(.system(size: 20))
                    Text("Add Sub Task").font(.title2)
                }
            })
            .padding(.vertical, 10)
            .padding(.horizontal)
            .buttonStyle(NoBackgroundButtonStyle())
            
            Spacer()
            
            HStack{
                CancelSheetButton(isPresented: $isPresented)
                AddJobSheetButton(isPresented: $isPresented)
            }
            .padding()
        }.background(VisualEffectBlurView())
    }
}

struct CancelSheetButton : View {
    @Binding var isPresented : Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.5))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
            
            Button(action: {
                isPresented = false
            }, label: {
                Text("Cancel")
            })
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            .buttonStyle(NoBackgroundButtonStyle())
            
            
        }
    }
}

struct AddJobSheetButton : View {
    @Binding var isPresented : Bool
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.black.opacity(0.7))
                .frame(maxWidth: .infinity)
                .frame(height: 40)
            
            Button(action: {
                isPresented = false
            }, label: {
                HStack{
                    Spacer()
                    Text("Add Job")
                    Spacer()
                }.padding()
            })
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .buttonStyle(NoBackgroundButtonStyle())
            
            
        }
    }
}
extension NSTextField{
    
    override open var focusRingType: NSFocusRingType {
        get {.none}
        set{}
    }
}


#Preview {
    AddJobSheet(isPresented: .constant(true))
}

