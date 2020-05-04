//
//  bankroll.swift
//  Stack&Stacks
//
//  Created by eddySum on 5/3/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct BankrollView: View {
    @EnvironmentObject var bankrollService: BankrollService
   
    var body: some View {
        VStack {
            Text("$\(bankrollService.bankroll.value, specifier: "%0.2f")")
            .foregroundColor(.white)
            .font(.largeTitle)
        }
    }
}
