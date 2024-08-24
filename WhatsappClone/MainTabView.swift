//
//  MainTabView.swift
//  WhatsappClone
//
//  Created by qwerty on 8/13/24.
//

import SwiftUI

struct MainTabView: View {
    
    init() {
        makeTabBarOpaque()
    }
    var body: some View {
        TabView{
            UpdatesTabScreen()
                .tabItem {
                    Image(systemName: Tab.updates.icon)
                    Text(Tab.updates.title)
                }
            CallsTabScreen()
                .tabItem {
                    Image(systemName: Tab.calls.icon)
                    Text(Tab.calls.title)
                }
            CommunityTabScreen()
                .tabItem {
                    Image(systemName: Tab.communities.icon)
                    Text(Tab.communities.title)
                }
            ChatsTabScreen()
                .tabItem {
                    Image(systemName: Tab.chats.icon)
                    Text(Tab.chats.title)
                }
            SettingsTabScreen()
                .tabItem {
                    Image(systemName: Tab.settings.icon)
                    Text(Tab.settings.title)
                }
        }
    }
    
    private func makeTabBarOpaque(){//tabViewi şeffaf bir arka plandan opak bir arka plana dönüştürür
        let apperance = UITabBarAppearance()
        apperance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = apperance
        UITabBar.appearance().scrollEdgeAppearance = apperance
    }
}

extension MainTabView{
    
    fileprivate func placeHolderItemView(_ title: String) -> some View{
        Text(title)
    }
    
    private enum Tab{
        case updates, calls, communities, chats, settings
        
        fileprivate var title: String {//TabBar için Text imkanı sağlar
            switch self {
            case .updates:
                return "Updates"
            case .calls:
                return "Calls"
            case .communities:
                return "Comminities"
            case .chats:
                return "Chats"
            case .settings:
                return "Settings"
            }
        }
        
        fileprivate var icon: String{//TabBar için image imkanı sağlar
            switch self {
            case .updates:
                return "circle.dashed.inset.filled"
            case .calls:
                return "phone"
            case .communities:
                return "person.3"
            case .chats:
                return "message"
            case .settings:
                return "gear"
            }
        }
    }
}

#Preview {
    MainTabView()
}
