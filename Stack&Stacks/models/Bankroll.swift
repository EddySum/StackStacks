//
//  Bankroll.swift
//  Stack&Stacks
//
//  Created by eddySum on 5/4/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

class Bankroll {
    var value: Double = 0
    var transactions: [Double] = []
    
    func setTransactions(data: [String: Any]) {
        if let transactions = data["transactions"] as? [Double] {
            self.transactions = transactions
        }
    }
    
    func calcBankroll(netProfit: Double) {
          let netTransaction = transactions.reduce(0.0, { (total:Double, transaction: Double) -> Double in
              return total + transaction
          })
          
          self.value = netTransaction + netProfit
    }
      
    
}
