//
//  TodoComponent.swift
//  Breeze
//
//  Created by johnny basgallop on 19/10/2024.
//

import SwiftUI

struct TodoComponent: View {
    let name: String
    var body: some View{
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
//                .padding(.horizontal)
            
            HStack{
                Text(name).foregroundStyle(.black).font(.system(size: 16))
                
                Spacer()
                
                HStack{
                    StartButton()
                    TodoMoreButton()
                }
            }
            .padding(.horizontal, 15)
            .frame(maxWidth: .infinity)
            .frame(height: 60)
        }
    }
}

struct StartButton: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5).fill(Color.black.opacity(0.7))
                .frame(maxWidth: 110)
            
            Button(action: {
                print("todo start button pressed")
            }, label: {
                HStack{
                    Text("Start").font(.system(size: 15, weight: .regular))
                    Image(systemName: "play.fill").font(.system(size: 16)).foregroundStyle(.green)
                }
            }).buttonStyle(NoBackgroundButtonStyle())
        }
        .padding(12)
        
    }
}

struct TodoMoreButton : View {
    var body: some View {
        Button(action: {
            print("todo more button pressed")
        }, label: {
            Image(systemName: "ellipsis").font(.system(size: 20)).foregroundStyle(.black)
        }).buttonStyle(NoBackgroundButtonStyle())
    }
}
#Preview {
    TodoComponent(name: "Go through the entire codebase")
}
