//
//  SessionDetail.swift
//  Stack&Stacks
//
//  Created by eddySum on 4/22/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct SessionDetail: View {
    @ObservedObject var session: Session;
    
    @State private var showCashoutNest = false
    @State private var showUpdateNest = false
    
    
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
                        Text("$\(self.session.netProfit, specifier: "%.2f")")
                            .bold()
                        Image(systemName: "chevron.up")
                    }
                }
            }
            
            HStack {
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Buy In")
                    Text("$\(session.totalExpense, specifier: "%.2f")")
                        .bold()
                }
                Spacer()
                
                if (session.cashout != nil) {
                    VStack(spacing: 10) {
                       Text("Cashout")
                       Text("$\(session.cashout!, specifier: "%.2f")")
                           .bold()
                    }
                    Spacer()
                }
                
                VStack(spacing: 10) {
                    Text("Peak")
                    Text("$\(session.peak, specifier: "%.2f")")
                        .bold()
                }
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Players")
                    Text("\(session.playerCount)")
                        .bold()
                }
                Spacer()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                NavigationLink(destination: updateSession(session: session, showView: $showUpdateNest), isActive: $showUpdateNest) {
                    VStack(spacing: 10) {
                        Image(systemName: "square.stack.3d.up.fill")
                        Text("Update")
                    }
                }.foregroundColor(.black)
                
                Spacer()
                
                NavigationLink(destination: updateSession(session: session, showView: $showCashoutNest), isActive: $showCashoutNest) {
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
