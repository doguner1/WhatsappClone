//
//  TextInputArea.swift
//  WhatsappClone
//
//  Created by qwerty on 8/23/24.
//

import SwiftUI

struct TextInputArea: View {
    @State var messageText = ""
    var body: some View {
        HStack(alignment:.bottom,spacing: 5){// alignment sayesinde textField uzun olduğunda dahi buttonlar altda duruyor. diğer türlü ortada kalıyorlar
            imagePickerButton()
                .padding(3)
            audioRecorderButton()
            messageTextField()
            sendButton()
        }
        .padding(.bottom)
        .padding(.horizontal,8)
        .padding(.top,10)
        .background(.whatsAppWhite)
    }
    private func messageTextField() -> some View{
        TextField("", text: $messageText,axis: .vertical)
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 20,style: .continuous)
                    .fill(.thinMaterial)
            ).overlay(
                textViewBorder()
            )
    }

    
    private func textViewBorder() -> some View {
        RoundedRectangle(cornerRadius: 20,style: .continuous)
            .stroke(Color(.systemGray5),lineWidth: 1)
    }
    
    private func imagePickerButton() -> some View{
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 21))
        })
    }
    private func audioRecorderButton() -> some View{
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "mic.fill")
                .fontWeight(.heavy)
                .imageScale(.small)
                .foregroundStyle(.white)
                .padding(6)
                .background(.blue)
                .clipShape(Circle())
                .padding(.horizontal,3)
        })
    }
    
    private func sendButton() -> some View{
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "arrow.up")
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(6)
                .background(Color.blue)
                .clipShape(Circle())
        })
    }
}

#Preview {
    TextInputArea()
}
