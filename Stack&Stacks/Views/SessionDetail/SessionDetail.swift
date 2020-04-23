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
    var buyIn: String = "$0"
    var peak: String = ""
    var playerCount = ""
    
    init(session: Session) {
        if let netProfit = session.netProfit {
            self.netProfit = "$\(netProfit)"
        }
        
        self.buyIn = "$\(session.totalExpense)"
        self.peak = "$\(session.peak)"
        self.playerCount = "\(session.playerCount)"
        
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
        }
    }
}
