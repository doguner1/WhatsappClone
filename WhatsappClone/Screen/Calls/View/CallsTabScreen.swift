//
//  CallsTabScreen.swift
//  WhatsappClone
//
//  Created by qwerty on 8/22/24.
//

import SwiftUI

struct CallsTabScreen: View {
    @State var search = ""
    @State private var callHistory = CallHistory.all
    var body: some View {
        NavigationStack{
            List{
                CreateCallLinkSection()
                Section{
                    ForEach(1..<12) { _ in
                        RecentCallItemView()
                    }
                }header: {
                    Text("Recent")
                        .textCase(nil)
                        .font(.headline)
                        .bold()
                        .foregroundStyle(.whatsAppBlack)
                }
            }
            .navigationTitle("Calls")
            .searchable(text: $search )
            .toolbar{
                leadingNavItem()
                trailingNavItem()
                principalNavItem()
            }
        }

    }
}

extension CallsTabScreen {
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button(action: {
                
            }, label: {
                Image(systemName: "phone.arrow.up.right")
            })
        }
    }
    
    @ToolbarContentBuilder
    private func leadingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button(action: {
                
            }, label: {
                Text("Edit")
            })
        }
    }
    
    @ToolbarContentBuilder
    private func principalNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Picker("", selection: $callHistory) {
                ForEach(CallHistory.allCases) { item in
                    Text(item.rawValue.capitalized)
                        .tag(item)
                }
            }
            .pickerStyle(.segmented)
            .frame(width: 150)
        }
    }
    
    private enum CallHistory: String, CaseIterable, Identifiable {
        case all, missed
        
        var id: String {
            return rawValue
        }
    }
}

private struct CreateCallLinkSection: View {
    var body: some View {
        HStack{
            Image(systemName: "link")
                .padding(8)
                .background(Color(.systemGray6))
                .clipShape(Circle())
                .foregroundColor(.blue)
            VStack(alignment: .leading){
                Text("Create Call Link")
                    .foregroundStyle(.blue)
                Text("Share a link for your WhatsApp call")
                    .foregroundStyle(.gray)
                    .font(.caption)
            }
        }
    }
}

private struct RecentCallItemView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 45,height: 45)
            recentCallsTextView()
            Spacer()
            Text("Yesterday")
                .foregroundStyle(.gray)
                .font(.system(size: 16))
            Image(systemName: "info.circle")
                .font(.system(size: 20))
        }
    }
    private func recentCallsTextView() -> some View {
        VStack(alignment: .leading){
            Text("Doğu GNR")
            HStack(spacing: 5){
                Image(systemName: "phone.arrow.up.right.fill")
                Text("Outgoing")
            }
            .font(.system(size: 14))
            .foregroundColor(.gray)
        }
    }
}

#Preview {
    CallsTabScreen()
}
