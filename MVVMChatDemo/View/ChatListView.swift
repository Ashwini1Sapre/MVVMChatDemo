//
//  ChatListView.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 17/04/21.
//

import SwiftUI


struct ChatListView: View {
   // @EnvironmentObject var viewModel: AnyViewModel<ChatListSate, Never>
    
    @EnvironmentObject private var store: Store<AppState, AppAction>
   
    var body: some View {
        NavigationView {
           // List(viewModel.chats)
            List(store.state.chats)
                {
                viewModel in
                NavigationLink(
                    destination: ChatDetailView(chat: viewModel))
                    {
                     //   .environmentObject(viewModel)) {
                    ChatCell(chat: viewModel)
                }
              
            }
            .navigationTitle("Chats")
        
        }
    .onAppear {
    
    self.store.send(.chatList(.reload))
    }
    }
}


//struct ChatListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatListView()
//    }
//}
