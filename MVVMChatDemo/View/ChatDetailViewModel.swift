//
//  ChatDetailViewModel.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 17/04/21.
//

import Foundation

class ChatDetailViewModel: ViewModel {
    
    @Published
    private(set) var state: ChatDetailState
    private let chatService: ChatService
    private let chat: Chat
    
    init(chat: Chat, chatService: ChatService) {
        
        
        self.chatService = chatService
        self.chat = chat
        self.state = ChatDetailState(chat: chat, currentUser: chatService.currentUser, message: [])
        self.state.message = fetchMessage()
    }
    
    
    func fetchMessage() -> [Message]
    {
        chatService.fetchMessage()
            .filter { $0.chartId == chat.id }
        
    }
    
    
    func trigger(_ input: ChatDetailInput) {
        switch input {
        case .addMessage(let message):
            chatService.addMessage(message, to: chat)
            self.state.message = fetchMessage()
        }
    }
    
    
    
}
