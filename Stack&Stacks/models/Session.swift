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
            let cashout = data["cashout"] as? Double,
            let type = data["type"] as? String,
            let totalExpense = data["totalExpense"] as? Double,
            let buyIns = data["buyIns"] as? [Double],
            let netProfit = data["netProfit"] as? Double,
            let startTime = data["startTime"] as? Timestamp,
            let endTime = data["endTime"] as? Timestamp
            else {
                return nil
                //return nil
            }
        
        
        self.cashout = cashout
        self.buyIns = buyIns
        self.buyIns = [5]
        self.netProfit = netProfit
        self.startTime = startTime.dateValue()
        self.startTime = endTime.dateValue()
        self.totalExpense = totalExpense
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

