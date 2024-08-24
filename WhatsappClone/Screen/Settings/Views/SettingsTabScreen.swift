//
//  SettingsTabScreen.swift
//  WhatsappClone
//
//  Created by qwerty on 8/23/24.
//

import SwiftUI

struct SettingsTabScreen: View {
    @State private var search = ""
    var body: some View {
        NavigationStack{
            List{
                SettingsHeaderView()
                
                Section{
                    SettingsItemView(item: .broadCastLists)
                    SettingsItemView(item: .starredMessages)
                    SettingsItemView(item: .linkedDevices)
                }
                
                Section{
                    SettingsItemView(item: .account)
                    SettingsItemView(item: .privacy)
                    SettingsItemView(item: .chats)
                    SettingsItemView(item: .notifications)
                    SettingsItemView(item: .storage)
                }
                Section{
                    SettingsItemView(item: .help)
                    SettingsItemView(item: .tellFriend)
                }
            }
            .navigationTitle("Settings")
            .searchable(text: $search)
            .toolbar{
                
            }
        }
        
    }
}

private struct SettingsHeaderView: View {
    var body: some View {
        Section{
            HStack{
                Circle()
                    .frame(width: 55,height: 55)
                userInfoTextView()
            }
            SettingsItemView(item: .avatar)
        }
    }
    private func userInfoTextView() -> some View{
        VStack(alignment: .leading,spacing: 0){
            HStack{
                Text("Doğu User")
                    .font(.title2)
                Spacer()
                Image(.qrcode)
                    .renderingMode(.template)
                    .padding(5)
                    .foregroundColor(.blue)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())
            }
            Text("Her there! I am using WhatsApp")
                .font(.callout)
                .foregroundStyle(.gray)
        }
    }
}



#Preview {
    SettingsTabScreen()
}
