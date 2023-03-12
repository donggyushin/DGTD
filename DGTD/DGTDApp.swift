//
//  DGTDApp.swift
//  DGTD
//
//  Created by 신동규 on 2023/03/05.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("init \(store)")
        return true
    }
}

@main
struct DGTDApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ToDoView(viewModel: DI.viewModel.toDo())
        }
    }
}
