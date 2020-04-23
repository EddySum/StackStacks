//
//  SessionDetail.swift
//  Stack&Stacks
//
//  Created by eddySum on 4/22/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct SessionDetail: View {
    
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
                        Text("$90.0")
                            .bold()
                        Image(systemName: "chevron.up")
                    }
                }
            }
            
            HStack {
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Buy In")
                    Text("$90.0")
                        .bold()
                }
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Peak")
                    Text("$90.0")
                        .bold()
                }
                Spacer()
                
                VStack(spacing: 10) {
                    Text("Players")
                    Text("5")
                        .bold()
                }
                Spacer()
            }
            Spacer()
        }
    }
}
