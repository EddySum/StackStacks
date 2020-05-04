//
//  bankroll.swift
//  Stack&Stacks
//
//  Created by eddySum on 5/3/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import FirebaseFirestore

class BankrollService: ObservableObject {
    let bankrollCollection = Firestore.firestore().collection("bankrolls")
    
    @Published var bankroll: Bankroll = Bankroll()
    var netProfit: Double = 0.00
    
    init() {
        self.getBankroll()
    }
    
    private func getBankroll() {
        bankrollCollection.getDocuments()
         { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                     self.bankroll.setTransactions(data: document.data())
                     self.bankroll.calcBankroll(netProfit: self.netProfit)
                }
            }
        }
    }
    
    func updateNetProfit(sessions: [Session]) {
        self.netProfit = sessions.reduce(0.0, { (total:Double, session:Session) -> Double in
            return total + session.netProfit
        })
        
        bankroll.calcBankroll(netProfit: self.netProfit)
    }
    

    
  
}

