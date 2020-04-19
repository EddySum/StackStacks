//
//  Sessions.swift
//  Stack&Stacks
//
//  Created by Adnan Sumra on 3/5/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct Sessions: View {
    @ObservedObject private var sessionService: SessionService = SessionService.init()
    
    var body: some View {
        VStack {
            
            Rectangle()
                .fill(Color.green)
                .frame(height: 125)
                .overlay(
                    Text("$255.55")
                        .foregroundColor(.white)
                        .font(.largeTitle)
            )
            Rectangle()
                .fill(Color.white)
                .cornerRadius(25)
                .offset(y: -25)
                .overlay(
                    VStack {
                        ForEach(sessionService.sessions) { session in
                            SessionItem(session: session)
                        }
                        Spacer()
                    }
            )
            Spacer()
            
            NavigationLink(destination: AddSession(sessionService: self.sessionService)) {
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


