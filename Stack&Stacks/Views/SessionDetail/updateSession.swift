//
//  updateSession.swift
//  Stack&Stacks
//
//  Created by eddySum on 4/23/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct updateSession: View {
    var session: Session;
    @Binding var showView: Bool
    
    @State var stack: String = "5.00";
    
    var body: some View {
        VStack(spacing: 50) {
            HStack {
                Text("Current Stack: $")
                    .bold()
                TextField("", text: $stack)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 100)
                    .font(Font.system(size: 25))
                       
            }
            .padding(EdgeInsets(top: 0, leading: 25, bottom: 0, trailing: 0))
            
            Button(action: {
                    self.showView = false
                    self.updateStack()
                }) {
                  Text("Submit")
                  .foregroundColor(.blue)
                  .font(.title)
                }
            
        }.navigationBarTitle(Text("Update Stack"))
    }
    
    func updateStack() {
        if let stack = Double(stack) {
            self.session.cashout(cashout: stack)
        }
    }
}

