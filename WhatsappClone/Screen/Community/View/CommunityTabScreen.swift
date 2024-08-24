//
//  CommunityTabScreen.swift
//  WhatsappClone
//
//  Created by qwerty on 8/22/24.
//

import SwiftUI

struct CommunityTabScreen: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment:.leading,spacing: 10){
                    Image(.communities)
                    Group{
                        Text("Stay connected wiht a community")
                            .font(.title2)
                        Text("Communitites bring members together in topic-based groups. Any comminty you're added to will appear here")
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal,5)
                    Button("See example communities >") { }
                        .frame(maxWidth: .infinity,alignment: .center)
                    
                    createNewCommunityButton()
                }
                .padding()
                .navigationTitle("Communities")
            }
        }
    }
    private func createNewCommunityButton() -> some View{
        Button{
            
        }label: {
            Label("New Community", systemImage: "plus")
                .bold()
                .frame(maxWidth: .infinity,alignment: .center)
                .padding(10)
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10,style: .continuous))
                .padding()
        }
    }
}

#Preview {
    CommunityTabScreen()
}
