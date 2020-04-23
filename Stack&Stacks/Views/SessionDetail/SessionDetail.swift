//
//  SessionDetail.swift
//  Stack&Stacks
//
//  Created by eddySum on 4/22/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct SessionDetail: View {
    var netProfit: String = "$0"
    var buyIn: String
    var peak: String
    var playerCount: String
    var cashout: String?
    
    init(session: Session) {
        if let netProfit = session.netProfit {
            self.netProfit = "$\(netProfit)"
        }
        
        self.buyIn = "$\(session.totalExpense)"
        self.peak = "$\(session.peak)"
        self.playerCount = "\(session.playerCount)"
        
        if let cashout = session.cashout {
            self.cashout = "\(cashout)"
        }
        
    }
    
    var body: some View {
        VStack(spacing: 30) {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(".25/.25 NL Hold’Em")
                    Text("My House")
                        .foregroundColor(Color.gray)
                }.padding(EdgeInsets(top: 25, leading: 25, bottom: 0, trailing: 0))
                Spacer()
            }
            
            HStack {
                VStack(spacing: 10) {
                    Text("Net Profit")
                    HStack {
                        Text(self.netProfit)
                            .bold()
                        Image(systemName: "chevron.up")
                    }
                }
            }
            
            HStack {
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Buy In")
                    Text(self.buyIn)
                        .bold()
                }
                Spacer()
                
                if (cashout != nil) {
                    VStack(spacing: 10) {
                       Text("Cashout")
                       Text(self.cashout!)
                           .bold()
                    }
                    Spacer()
                }
                
                VStack(spacing: 10) {
                    Text("Peak")
                    Text(self.peak)
                        .bold()
                }
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Players")
                    Text(self.playerCount)
                        .bold()
                }
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                NavigationLink(destination: updateSession()) {
                    VStack(spacing: 10) {
                        Image(systemName: "1.square.fill")
                        Text("Update")
                    }
                }.foregroundColor(.black)
                
                Spacer()
                
                NavigationLink(destination: updateSession()) {
                    VStack(spacing: 10) {
                        Image(systemName: "flag.fill")
                        Text("Cashout")
                    }
                }.foregroundColor(.black)
                
                Spacer()
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 25, trailing: 0))
        }
    }
}
