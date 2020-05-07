//
//  ProfileView.swift
//  Stack&Stacks
//
//  Created by eddySum on 5/7/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

enum TransactionType  {
    case WITHDRAW
    case DEPOSIT
}

struct AccountView: View {
    @State var transactionType: TransactionType = TransactionType.WITHDRAW
    
    
    init() {
        
    }
    
    func setTransactionType(type: TransactionType) {
        
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 25) {
                Button(action: {
                    self.transactionType = TransactionType.DEPOSIT
                }) {
                    Text("Deposit")
                        .foregroundColor(transactionType == TransactionType.DEPOSIT ? .primary : .secondary)
                        .fontWeight(transactionType == TransactionType.DEPOSIT ? .bold : .none)
                }
                
                Button(action: {
                    self.transactionType = TransactionType.WITHDRAW
                }) {
                    Text("Withdraw")
                        .foregroundColor(transactionType == TransactionType.WITHDRAW ? .primary : .secondary)
                        .fontWeight(transactionType == TransactionType.WITHDRAW ? .bold : .none)
                }
            }.padding(.top, 25)

            Spacer()
        }
        
        
        
    }
}

