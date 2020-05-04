//
//  bankroll.swift
//  Stack&Stacks
//
//  Created by eddySum on 5/3/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import FirebaseFirestore

class Bankroll: ObservableObject {
    let bankrollCollection = Firestore.firestore().collection("bankrolls")
    
    @Published var bankroll: Double = 0
    var transactions: [Double] = []
    var netProfit: Double = 0
    
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
                    self.storeBankroll(data: document.data())
                    self.calcBankroll()
                }
            }
        }
    }
    
    // set bankroll from get Bankroll firebase request
    private func storeBankroll(data: [String: Any]) {
        if let transactions = data["transactions"] as? [Double] {
            self.transactions = transactions
        }
    }
    
    private func calcBankroll() {
        let netTransaction = transactions.reduce(0.0, { (total:Double, transaction: Double) -> Double in
            return total + transaction
        })
        
        self.bankroll = netTransaction + self.netProfit
    }
    
}

