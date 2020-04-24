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
    var docRef: DocumentReference
    
    var type: SessionTypes? = nil
    var buyIns: [Double] = []
    var playerCount: Int
    var cashout: Double? = nil
    var netProfit: Double = 0
    var totalExpense: Double
    var startTime: Date
    var endTime: Date? = nil
    var peak: Double
    var blinds: String
    var location: String
    
    init?(data: [String: Any], docRef: DocumentReference) {
        guard
            let type = data["type"] as? String,
            let buyIns = data["buyIns"] as? [Double],
            let cashout = data["cashout"] as? Double?,
            let netProfit = data["netProfit"] as? Double?,
            let endTime = data["endTime"] as? Timestamp?,
            let playerCount = data["playerCount"] as? Int,
            let blinds = data["blinds"] as? String,
            let location = data["location"] as? String
            else {
                return nil
            }
        
        
        self.cashout = cashout
        self.buyIns = buyIns
        self.playerCount = playerCount
        self.blinds = blinds
        self.location = location
        
        if let netProfit = netProfit {
            self.netProfit = netProfit
        }
         
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
        
        self.peak = self.totalExpense
        self.docRef = docRef
        
        self.type = Session.getTypeFromString(typeStr: type)
        
    }
    
    func rebuy(rebuy: Double) {
        buyIns.append(rebuy)
        totalExpense += rebuy
    }
    
    func cashout(cashout: Double) {
        self.endTime = Date.init()
        self.cashout = cashout
        
        self.updatePeak(stack: cashout)
        
        self.netProfit = calcNetProfit(stack: cashout)
        
        let data = ["cashout": self.cashout as Any, "endTime": self.endTime as Any, "netProfit": self.netProfit, "peak": self.peak] as [String : Any]
        updateDocument(data: data)
    }
    
    func updateStack(stack: Double) {
        self.updatePeak(stack: stack)
        
        self.netProfit = calcNetProfit(stack: stack)
        
        let data = ["netProfit": self.netProfit, "peak": self.peak]
        updateDocument(data: data)
    }
    
    private func updateDocument(data: [String: Any]) {
        docRef.updateData(data) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
    }
    
    private func updatePeak(stack: Double) {
        if (stack > self.peak) {
            self.peak = stack
        }
    }
    
    private func calcNetProfit(stack: Double) -> Double {
        return stack - self.totalExpense
    }
    
    private static func getTypeFromString(typeStr: String) -> SessionTypes {
        if (typeStr == "cash") {
            return SessionTypes.Cash
        } else {
            return SessionTypes.Tournament
        }
    }
    
    
}

