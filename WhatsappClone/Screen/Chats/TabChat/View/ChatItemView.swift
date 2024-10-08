//
//  ChatItemView.swift
//  WhatsappClone
//
//  Created by qwerty on 8/23/24.
//

import SwiftUI

struct ChatItemView: View {
    var body: some View {
        HStack(alignment: .top,spacing: 10){
            Circle()
                .frame(width: 60,height: 60)
            VStack(alignment: .leading,spacing: 3){
                titleTextView()
                lastMessagePreview()
            }
        }
    }
    
    private func titleTextView() -> some View{
        HStack {
            Text("userName here")
                .lineLimit(1)
                .bold()
            
            Spacer()
            
            Text("5.50 PM")
                .foregroundStyle(.gray)
                .font(.system(size: 15))
        }
    }
    
    private func lastMessagePreview() -> some View{
        Text("Hey welcome")
            .font(.system(size: 16))
            .lineLimit(2)
            .foregroundColor(.gray)
    }
}

#Preview {
    ChatItemView()
}
