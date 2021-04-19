//
//  ChatDetailView.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 17/04/21.
//

import SwiftUI


struct ChatDetailState {
    var chat: Chat
    var currentUser: String?
    var message: [Message]
    
}


enum ChatDetailInput {
    case addMessage(String)
   // case addMessage(String)
}


struct ChatDetailView: View {
    
    
    private let chat: Chat
    
    @EnvironmentObject private var store: Store<AppState,AppAction>
    
    
    
    

    @EnvironmentObject private var keyboardObserver: KeyboardObserver
    
    @State private var newMessage = ""
    
    init(chat: Chat) {
        self.chat = chat
    }
    
    
   
    
    var body: some View {
        VStack {
            List(store.state.messages(in: chat)) { message in
                
                MessageView(message: message, isMine: self.store.state.currentUser == message.sender)
                
             
            }
            
            .onTapGesture{
                self.endEditing(force: true)
                
            }
            Divider()
            
            HStack {
                TextField("New Message",
                          text: $newMessage,
                          onCommit: sendMessage)
                
                Button(action: sendMessage)  {
                    Text("Send")
                }
            }.padding([.leading, .top,.trailing])
                
            }
            .padding(.bottom, keyboardObserver.height)
            .navigationBarTitle(Text(chat.title),
                                displayMode: .inline )
            .animation(.easeInOut)
            
      
       
    }
    
  
    
}


extension ChatDetailView {
    
    private func sendMessage() {
//        viewModel.trigger(.addMessage(newMessage))
//        newMessage = ""
        
        
        store.send(.chatDetail(.add(newMessage, to: chat)))
        newMessage = ""
        
    }
    
    private func endEditing(force: Bool) {
        
        UIApplication.shared.windows.forEach {
            
            $0.endEditing(force)
        }
        
    }
    
    
    
}

//struct ChatDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
//    }
//}
