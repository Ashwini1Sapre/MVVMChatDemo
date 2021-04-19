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
           
//            let chatservice = MockChatService()
//            let viewModel = AnyViewModel(ChatListViewModel(chatService: chatservice))
//
            let store = Store(initialState: AppState(), reducer: Reducer.appReducer())
            
            ChatListView()
                .environmentObject(store)
                .environmentObject(KeyboardObserver.shared)
            
            
           // ContentView()
        }
    }
}
