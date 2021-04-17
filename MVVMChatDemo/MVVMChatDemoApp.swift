//
//  MVVMChatDemoApp.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 17/04/21.
//

import SwiftUI

@main
struct MVVMChatDemoApp: App {
    var body: some Scene {
        WindowGroup {
           
            let chatservice = MockChatService()
            let viewModel = AnyViewModel(ChatListViewModel(chatService: chatservice))
            ChatListView()
                .environmentObject(viewModel)
                .environmentObject(KeyboardObserver.shared)
            
            
           // ContentView()
        }
    }
}
