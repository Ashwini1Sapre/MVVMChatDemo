//
//  ChatListViewModel.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 17/04/21.
//

import Foundation

class ChatListViewModel: ViewModel {
    @Published var state: ChatListSate
    
    init(chatService: ChatService) {
        
        let viewModels = chatService.fetchChats().map {
            
            AnyViewModel(ChatDetailViewModel(chat: $0, chatService: chatService))
        }
        self.state = ChatListSate(chats: viewModels)
        
    }
    
    func trigger(_ input: Never) {
        
    }
    
   
}

