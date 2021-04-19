//
//  AppReducer.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 19/04/21.
//

import Foundation


extension Reducer where State == AppState, Action == AppAction {
    static func appReducer() -> Reducer {
        
        let chatService: ChatService = MockChatService()
        return Reducer { state, action in
            switch action {
            
            case .chatDetail(let action):
                handelChatDeatilAction(action, chatService: chatService)
            case .chatList(let action):
            handelChatListAction(action)
            }
            
            return Reducer.sync { state in
                
                state.currentUser = chatService.currentUser
                state.chats = chatService.fetchChats()
                state.message = chatService.fetchMessage()
               
            }
            
          
        }
   
    }
    
    
    private static func handelChatListAction(_ action: ChatListAction) {
        switch action {
        case .reload:
           break
       
        }
        
    }
    
    private static func handelChatDeatilAction(_ action: ChatDetailAction, chatService: ChatService)
    {
        switch action {
        case .reload:
            break
        case let .add(content, chat):
            chatService.addMessage(content, to: chat)
            
        }

      
    }
    
    
    
}
 
