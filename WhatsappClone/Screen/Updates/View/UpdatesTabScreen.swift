//
//  UpdatesTabScreen.swift
//  WhatsappClone
//
//  Created by qwerty on 8/13/24.
//

import SwiftUI

struct UpdatesTabScreen: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            List{
                StatusSectionHeader()
                    .listRowBackground(Color.clear)
                //------------
                StatusSection()
                //------------
                Section{
                    RecentIpdatesItemView()
                }header: {
                    Text("Recent Updates")
                }
                //------------
                Section{
                    ChannelListView()
                }header: {
                    channelSectionHeader()
                }
                
                //------------
            }.listStyle(.grouped)
                .navigationTitle("Updates")
                .searchable(text: $searchText)
        }
    }
    private func channelSectionHeader() -> some View {
        HStack{
            Text("Channels")
                .bold()
                .font(.title3)
                .textCase(nil)
                .foregroundStyle(.whatsAppBlack)
            
            Spacer()
            
            Button{
                
            }label: {
                Image(systemName: "plus")
                    .padding(7)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())
            }
        }
    }
}

extension UpdatesTabScreen{
    enum Constant {
        static let imageDimen: CGFloat = 55
    }
}

private struct StatusSectionHeader: View {
    var body: some View {
        HStack(alignment: .top){
            Image(systemName: "circle.dashed")
                .foregroundStyle(.blue)
                .imageScale(.large)
            
            (
                
                Text("Use Status tp share photos, text and videos that disappear in 24 Hours")
                +
                Text(" ")
                +
                Text("Status Privacy")
                    .foregroundStyle(.blue).bold()
                
            )
            
            Image(systemName: "xmark")
        }
        .padding()
        .background(.whatsAppWhite)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}
private struct StatusSection: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: UpdatesTabScreen.Constant.imageDimen,height: UpdatesTabScreen.Constant.imageDimen)
            
            VStack(alignment: .leading){
                Text("My Status")
                    .font(.callout).bold()
                
                Text("Add to my status")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
            }
            Spacer()
            statusButton(iconName: "camera.fill")
            statusButton(iconName: "pencil")
            
        }
    }
    
    private func statusButton(iconName: String) -> some View{
        Button(action: {
            
        }, label: {
            Image(systemName: iconName)
                .padding(10)
                .background(Color(.systemGray5))
                .clipShape(Circle())
        })
        
    }
}
private struct RecentIpdatesItemView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: UpdatesTabScreen.Constant.imageDimen,height: UpdatesTabScreen.Constant.imageDimen)
            VStack(alignment: .leading){
                Text("Dogukan Güner")
                    .font(.callout).bold()
                
                Text("1h ago")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
            }
            Spacer()
        }
    }
}
private struct ChannelListView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Stay updated on topics that matter tp you. Find channels to follow below.")
                .foregroundStyle(.gray)
                .font(.callout)
                .padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(0..<5) { _ in
                        ChannelItemView()
                    }
                }
            }
            Button("Explore more") { }
                .tint(.blue)
                .bold()
                .buttonStyle(.borderedProminent)
                .clipShape(Capsule())
                .padding()
        }
    }
}
private struct ChannelItemView: View {
    var body: some View {
        VStack{
            Circle()
                .frame(width: UpdatesTabScreen.Constant.imageDimen,height: UpdatesTabScreen.Constant.imageDimen)
            
            Text("Real Madric C.F")
            
            Button{
                
            }label: {
                Text("Follow")
                    .bold()
                    .padding(5)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
                    .clipShape(Capsule())
            }
        }
        .padding(.horizontal,16)
        .padding(.vertical)
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4),lineWidth: 1)
        }
    }
}

#Preview {
    UpdatesTabScreen()
}
