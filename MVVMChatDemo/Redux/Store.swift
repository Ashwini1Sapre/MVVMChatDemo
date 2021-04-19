//
//  Store.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 19/04/21.
//

import Foundation
import Combine

final class Store<State, Action>: ObservableObject {
    
    @Published private(set) var state: State
    private let reducer: Reducer<State, Action>
    private var cancellable: Set<AnyCancellable> = []
    
    init(initialState: State, reducer: Reducer<State, Action>) {
        self.state = initialState
        self.reducer = reducer
    }
    
    
    func send(_ action: Action) {
        reducer
            .reduce(state, action)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: perform)
            .store(in: &cancellable)
        
    }
    private func perform(change: Reducer<State, Action>.Change){
        change(&state)
    }
    
    
    
}
