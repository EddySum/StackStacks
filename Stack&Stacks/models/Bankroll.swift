//
//  Bankroll.swift
//  Stack&Stacks
//
//  Created by eddySum on 5/4/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import Combine
import FirebaseFirestore

class Bankroll: ObservableObject {
    var docRef: DocumentReference? = nil
    @Published var value: Double = 0
    var transactions: [Double] = []
    var currentNetProfit: Double = 0
    
    func setTransactions(data: [String: Any]) {
        if let transactions = data["transactions"] as? [Double] {
            self.transactions = transactions
        }
    }
    
    func calcBankroll(netProfit: Double) {
          let netTransaction = transactions.reduce(0.0, { (total:Double, transaction: Double) -> Double in
              return total + transaction
          })
        
          self.currentNetProfit = netProfit
          
          self.value = netTransaction + netProfit
    }
    
    func addTransaction(transaction: Double) {
        self.transactions.append(transaction)
        self.calcBankroll(netProfit: self.currentNetProfit)
        
        let data = ["transactions": self.transactions as Any, "value": value as Any] as [String : Any]
        
        if let docRef = docRef {
            docRef.updateData(data) { err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        }
        
    }
    
    func setDocRef(docRef: DocumentReference) {
        self.docRef = docRef
    }
      
    
}
