//
//  ChatCell.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 17/04/21.
//


import SwiftUI

struct ChatCell: View {
    let chat: Chat
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(chat.title)
                .font(.headline)
            Text(chat.subtitle)
                .font(.footnote)
                .foregroundColor(Color.gray)
           
        }
      
    }
 
}
