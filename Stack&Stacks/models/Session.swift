//
//  Sessions.swift
//  Stack&Stacks
//
//  Created by Adnan Sumra on 2/20/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import Foundation
import FirebaseFirestore

enum SessionTypes {
    case Cash
    case Tournament
}

class Session: Identifiable, ObservableObject {
    var id = UUID()
    
    var type: SessionTypes? = nil
    var buyIns: [Double] = []
    var cashout: Double? = nil
    var netProfit: Double? = nil
    var totalExpense: Double? = nil
    var startTime: Date
    var endTime: Date? = nil
    
    init?(data: [String: Any]) {
        guard
            let type = data["type"] as? String,
            let buyIns = data["buyIns"] as? [Double],
            let cashout = data["cashout"] as? Double?,
            let netProfit = data["netProfit"] as? Double?,
            let endTime = data["endTime"] as? Timestamp?
            else {
                return nil
            }
        
        
        self.cashout = cashout
        self.buyIns = buyIns
        self.netProfit = netProfit
        
        // check for Timestamp due to firebase results & then Date for local date creation
        if let startTime = data["startTime"] as? Timestamp {
            self.startTime = startTime.dateValue()
        } else if let startTime = data["startTime"] as? Date {
            self.startTime = startTime
        } else {
            return nil
        }
        
        if let endTime = endTime {
            self.endTime = endTime.dateValue()
        }
        
        self.totalExpense = buyIns.reduce(0, +)
        self.type = getTypeFromString(typeStr: type)
        
    }
    
    // inital buyin
    init?(type: SessionTypes, buyIn: Double, startTime: Date) {
        self.type = type
        
        if (buyIn < 0) {
            return nil
        }
        
        self.buyIns = []
        self.buyIns.append(buyIn)
        
        self.totalExpense = buyIn
        self.startTime = startTime
    }
    
    func rebuy(rebuy: Double) {
        buyIns.append(rebuy)
        totalExpense! += rebuy
    }
    
    func cashout(cashout: Double) {
        self.endTime = Date.init()
        self.cashout = cashout
        
        self.netProfit = calcNetProfit()
    }
    
    private func calcNetProfit() -> Double {
        return self.cashout! - self.totalExpense!
    }
    
    private func getTypeFromString(typeStr: String) -> SessionTypes {
        if (typeStr == "cash") {
            return SessionTypes.Cash
        } else {
            return SessionTypes.Tournament
        }
    }
    
    
}

