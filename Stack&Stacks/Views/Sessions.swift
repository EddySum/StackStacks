//
//  Sessions.swift
//  Stack&Stacks
//
//  Created by Adnan Sumra on 3/5/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct Sessions: View {
    @EnvironmentObject var sessionService: SessionService
    @EnvironmentObject var bankrollService: BankrollService
    @State private var showNested = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .leading, endPoint: .trailing))
                .frame(height: 125)
                .overlay(
                    BankrollView(bankroll: bankrollService.bankroll)
            )
            Rectangle()
                .fill(Color.white)
                .cornerRadius(25)
                .offset(y: -25)
                .overlay(
                    VStack {
                        ForEach(sessionService.sessions) { session in
                            NavigationLink(destination: SessionDetail(session: session)) {
                                SessionItem(session: session)
                            }.foregroundColor(Color.black)
                        }
                        Spacer()
                    }
            )
            Spacer()
            
            NavigationLink(destination: AddSession(sessionService: self.sessionService, showView: $showNested), isActive: $showNested) {
                Rectangle()
                .fill(Color.white)
                .frame(width: 169, height: 50)
                .padding(.bottom)
                .shadow(color: Color(red: 0.93, green: 0.93, blue: 0.84), radius: 5, x: 0, y: 0)
                .overlay(
                    Text("New Session")
                    .foregroundColor(.black)
                    .fontWeight(.medium)
                    .padding(.bottom)
                )
            }
        }
    }
}


