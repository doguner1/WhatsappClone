//
//  ChatRoomScreen.swift
//  WhatsappClone
//
//  Created by qwerty on 8/23/24.
//

import SwiftUI

struct ChatRoomScreen: View {
    var body: some View {
        MessageListView()
        .toolbar(.hidden,for: .tabBar)
        .toolbar{
            leadingNavItems()
            trailingNavItems()
        }
        .safeAreaInset(edge: .bottom){//Bu şekilde ekranın en alt güvenli alana yerleştirmiş olduk
            TextInputArea()
        }
    }
}



extension ChatRoomScreen{
    @ToolbarContentBuilder
    private func leadingNavItems() -> some ToolbarContent{
        ToolbarItem(placement: .topBarLeading){
            HStack{
                Circle()
                    .frame(width: 35,height: 35)
                
                Text("Doğu")
            }
        }
    }
    private func trailingNavItems() -> some ToolbarContent{
        ToolbarItem(placement: .topBarTrailing){
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "video")
                })
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "phone")
                })
            }
        }
    }
}

#Preview {
    NavigationStack{
        ChatRoomScreen()
    }
}
