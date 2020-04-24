//
//  updateSession.swift
//  Stack&Stacks
//
//  Created by eddySum on 4/23/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct updateSession: View {
    let screenSize: CGRect = UIScreen.main.bounds
    
    @State var cashout: String = "5.00";
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Current Stack: $")
                    .bold()
                TextField("", text: $cashout)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
                    .font(Font.system(size: 25))
                       
            }
            .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
            
        }.navigationBarTitle(Text("Update Stack"))
    }
}

