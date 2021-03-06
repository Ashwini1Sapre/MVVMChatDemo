//
//  ViewModel.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 17/04/21.
//

import Combine
import Foundation

protocol ViewModel: ObservableObject where ObjectWillChangePublisher.Output == Void {
    
    associatedtype State
    associatedtype Input
    var state: State { get }
    func trigger(_ input: Input)
}

extension AnyViewModel: Identifiable where State: Identifiable {
    var id: State.ID {
        state.id
    }
 
  
}

@dynamicMemberLookup
   final class AnyViewModel<State, Input>: ViewModel {
    private let wrappedObjectWillChange: () -> AnyPublisher<Void, Never>
    private let wrappedState: () -> State
    private let wrappedTrigger: (Input) -> Void
 
    var objectWillChange: AnyPublisher<Void, Never> {
        wrappedObjectWillChange()
    }
    var state: State {
        wrappedState()
    }
    func trigger(_ input: Input)
    {
        wrappedTrigger(input)
    }
    subscript<Value>(dynamicMember keyPath: KeyPath<State, Value>) -> Value {
        state[keyPath: keyPath]
    }
    
    init<V: ViewModel>(_ ViewModel: V) where V.State == State, V.Input == Input {
        self.wrappedObjectWillChange = { ViewModel.objectWillChange.eraseToAnyPublisher() }
        self.wrappedState = { ViewModel.state }
        self.wrappedTrigger = ViewModel.trigger
        
    }
    
}
