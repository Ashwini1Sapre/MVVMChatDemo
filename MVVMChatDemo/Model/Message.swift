//
//  Message.swift
//  MVVMChatDemo
//
//  Created by Knoxpo MacBook Pro on 17/04/21.
//

import Foundation

struct Message: Codable, Identifiable {
    var id: String
    var chartId: String
    var date: Date
    var sender: String
    var content: String
    
    
    
}
