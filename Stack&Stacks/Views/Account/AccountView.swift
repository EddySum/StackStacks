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
    @State private var transactionAmt = "0.00"
    
    init() {
        
    }
    
    func setTransactionType(type: TransactionType) {
        
    }
    
    var body: some View {
        VStack(spacing: 16) {
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
            
            HStack {
                TextField("Amount", text: Binding(
                    get: { "$\(self.transactionAmt)" },
                    set: { (userInp) in
                        self.transactionAmt = userInp.filter("0123456789.".contains)
                }))
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
            }
            
            Button(action: {
                print("Button action")
            }) {
                HStack {
                    Image(systemName: transactionType == TransactionType.WITHDRAW ? "chevron.up" : "chevron.down")
                    Text("Transact")
                }
            }
                .foregroundColor(Color.white)
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(15.0)
            
            Spacer()
        }

        
        
        
        
    }
}

