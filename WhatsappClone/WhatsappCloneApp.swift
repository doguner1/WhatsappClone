//
//  WhatsappCloneApp.swift
//  WhatsappClone
//
//  Created by qwerty on 8/13/24.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct WhatsappCloneApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            LoginScreen()
        }
    }
}
