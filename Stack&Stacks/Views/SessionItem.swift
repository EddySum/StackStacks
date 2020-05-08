//
//  SessionItem.swift
//  Stack&Stacks
//
//  Created by Adnan Sumra on 3/5/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI


struct SessionItem: View {
    let screenSize: CGRect = UIScreen.main.bounds
    
    let dateStyle: DateFormatter //TODO: move to a pipe helper file
    let session: Session
    
    var netProfitStr: String
    var netProfitColor: Color
    
    init(session: Session) {
        self.session = session
        
        dateStyle = DateFormatter()
        dateStyle.dateStyle = .short
        
        
    
        if (session.netProfit < 0) {
            netProfitStr = "\(session.netProfit)"
            netProfitColor = Color(UIColor.systemRed)
        } else {
            netProfitStr = "+\(session.netProfit)"
            netProfitColor = Color(UIColor.systemGreen)
        }
    }
    
    var body: some View {
        VStack {
            Rectangle()
               .fill(Color.white)
                .frame(width: screenSize.width-20, height: 60)
                .shadow(color: Color(red: 0.93, green: 0.93, blue: 0.84), radius: 5, x: 0, y: 0)
                .overlay(
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("\(session.blinds) NL Hold'Em")
                            Text("\(dateStyle.string(from: session.startTime))")
                        }
                        Spacer()
                        
                        if (session.cashout != nil){
                            Text(netProfitStr)
                            .foregroundColor(netProfitColor)
                        } else {
                            HStack {
                                Text("Live")
                                Circle()
                                .fill(Color.green)
                                .frame(width: 25, height: 25)
                            }
                        }
                        
                }

                    .padding()
                )
        }
        
    }
}

