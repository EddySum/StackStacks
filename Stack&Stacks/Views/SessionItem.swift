//
//  SessionItem.swift
//  Stack&Stacks
//
//  Created by Adnan Sumra on 3/5/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI


let sessionSeed: Session = Session.init(
    type: SessionTypes.Cash,
    buyIn: 55,
    startTime: Date.init()
)!

struct SessionItem: View {
    let screenSize: CGRect = UIScreen.main.bounds
    
    let dateStyle: DateFormatter //TODO: move to a pipe helper file
    let session: Session
    
    init(session: Session) {
        self.session = session
        
        dateStyle = DateFormatter()
        dateStyle.dateStyle = .short
    }
    
    var body: some View {
        VStack {
            Rectangle()
               .fill(Color.white)
                .frame(width: screenSize.width-20, height: 50)
                .shadow(color: Color(red: 0.93, green: 0.93, blue: 0.84), radius: 5, x: 0, y: 0)
                .overlay(
                    HStack {
                        VStack(alignment: .leading) {
                            Text(".25/ .25 NL Hold'Em")
                            Text("\(dateStyle.string(from: session.startTime))")
                        }
                        Spacer()
                        
                        if (session.cashout != nil ){
                            Text("+\(session.cashout!, specifier: "%.02f")")
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

struct SessionItem_Previews: PreviewProvider {
    static var previews: some View {
        SessionItem(session: sessionSeed)
    }
}
