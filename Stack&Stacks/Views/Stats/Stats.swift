//
//  Stats.swift
//  Stack&Stacks
//
//  Created by eddySum on 5/1/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct Stats: View {
    @EnvironmentObject var sessionService: SessionService
    
    init() {
        
    }
    
    var body: some View {
         VStack(spacing: 18)  {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Sessions")
                    Text("# of Sessions")
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text("55")
            }.padding(.horizontal)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Profit/Hour")
                    Text("Profit per hour")
                        .foregroundColor(.secondary)
                }
                Spacer()
                Text("$90")
            }.padding(.horizontal)
        }
    }
}
