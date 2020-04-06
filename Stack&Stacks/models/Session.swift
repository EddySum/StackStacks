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

class Session {
    var docRef: DocumentReference? = nil;
    
    var type: SessionTypes
    var buyIns: [Double]
    var cashout: Double? = nil
    var netProfit: Double? = nil
    var totalExpense: Double
    var startTime: Date
    var endTime: Date? = nil
    
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
        
        
        //create new session in firebase
        let sessionCollection = Firestore.firestore().collection("sessions");
        
        var typeStr: String;
        if (type == SessionTypes.Cash) {
            typeStr = "cash";
        } else {
            typeStr = "tournament"
        }
        
        self.docRef = sessionCollection.addDocument(data: [
            "buyIn": buyIn,
            "totalExpense": buyIn,
            "startTime": startTime,
            "type": typeStr
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(self.docRef!.documentID)")
            }
        }
    }
    
    func rebuy(rebuy: Double) {
        buyIns.append(rebuy)
        totalExpense += rebuy
    }
    
    func cashout(cashout: Double) {
        self.endTime = Date.init()
        self.cashout = cashout
        
        self.netProfit = calcNetProfit()
    }
    
    private func calcNetProfit() -> Double {
        return self.cashout! - self.totalExpense
    }
    
    
}

