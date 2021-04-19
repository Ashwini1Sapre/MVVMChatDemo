//
//  AppAction.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 19/04/21.
//

import Foundation


enum AppAction {
    case chatList(ChatListAction)
    case chatDetail(ChatDetailAction)
}

enum ChatListAction {
    
    case reload
}

enum ChatDetailAction {
    
    case reload
 
    case add(String, to: Chat)
}
