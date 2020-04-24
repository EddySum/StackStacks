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
    
    //TODO:? Turn updateType into enumeration
    var updateType: String = "Update Stack"
    
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
            
        }.navigationBarTitle(Text(updateType))
    }
    
    func updateStack() {
        if let stack = Double(stack) {
            if (updateType == "Update Stack") {
                self.session.updateStack(stack: stack)
            } else {
                self.session.cashout(cashout: stack)
            }
        }
    }
}

