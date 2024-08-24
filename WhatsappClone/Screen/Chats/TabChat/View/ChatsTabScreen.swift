//
//  ChatsTabScreen.swift
//  WhatsappClone
//
//  Created by qwerty on 8/22/24.
//

import SwiftUI

struct ChatsTabScreen: View {
    @State var search = ""
    var body: some View {
        NavigationStack{
            List{
                archivedButton()
                
                ForEach(1..<13) { _ in
                    NavigationLink(destination: ChatRoomScreen()) {
                            ChatItemView()
                        }
                    
                }
                
                inboxFootreView()
                    .listRowSeparator(.hidden)
                

            }.listStyle(.plain)
            .navigationTitle("Chats")
            .searchable(text: $search)
            .toolbar {
                leadingNavItem()
                trailingNavItem()
            }
        }
    }
}

extension ChatsTabScreen {
    @ToolbarContentBuilder
    private func leadingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading){
            Menu {
                Button {
                    print("select")
                } label: {
                    Label("Select Chats", systemImage: "checkmark.circle")
                }

            } label: {
                Image(systemName: "ellipsis.circle")
            }
        }
    }
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItemGroup(placement: .topBarTrailing){//Group ile yazdık çoklu item kullanacağımız için
            aiButton()
            cameraButton()
            newChatButton()
        }
        
    }
    private func aiButton() -> some View {
        Button(action: {}, label: {
            Image(.circle)
        })
    }
    private func newChatButton() -> some View {
        Button(action: {}, label: {
            Image(.plus)
        })
    }
    private func cameraButton() -> some View {
        Button(action: {}, label: {
            Image(systemName: "camera")
        })
    }
    private func archivedButton() -> some View{
        Button(action: {}, label: {
            Label("Archived",systemImage: "archivebox.fill")
                .bold()
                .padding()
                .foregroundColor(.gray)
        })
    }
    private func inboxFootreView() -> some View{
        HStack{
            Image(systemName: "lock.fill")
            (
            Text("Your oersınel messages are ")
            +
            Text("and-toend encrpted")
                .foregroundStyle(.blue)
            ).onTapGesture {
                print("encrpted")
            }
        }
        .foregroundColor(.gray)
        .font(.caption)
        .padding(.horizontal)
    }
}

#Preview {
    ChatsTabScreen()
}
