//
//  ChatService.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 17/04/21.
//

import Foundation

protocol ChatService
{
    
    var currentUser: String? { get  }
    func fetchChats() -> [Chat]
    func fetchMessage() -> [Message]
    
    @discardableResult
    func addMessage(_ content: String, to chat: Chat) -> Message
    
    
}
