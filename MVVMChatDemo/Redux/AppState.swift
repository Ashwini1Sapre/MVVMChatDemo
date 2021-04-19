//
//  AppState.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 19/04/21.
//

import Foundation

struct AppState {
    var chats: [Chat] = []
    var message: [Message] = []
    var currentUser: String? = nil
    
    func messages(in chat: Chat) -> [Message] {
        
        message.filter { $0.chartId == chat.id }
    }
    
    
    
    
}
