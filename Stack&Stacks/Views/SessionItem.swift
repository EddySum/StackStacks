//
//  SessionItem.swift
//  Stack&Stacks
//
//  Created by Adnan Sumra on 3/5/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI


let session: Session = Session.init(
    type: SessionTypes.Cash,
    buyIn: 50,
    startTime: Date.init()
)!

struct SessionItem: View {
    let screenSize: CGRect = UIScreen.main.bounds
    var session: Session
    
    var body: some View {
        VStack {
            Rectangle()
               .fill(Color.white)
                .frame(width: screenSize.width-20, height: 50)
                .shadow(color: Color(red: 0.93, green: 0.93, blue: 0.84), radius: 5, x: 0, y: 0)
        }
        
    }
}

struct SessionItem_Previews: PreviewProvider {
    static var previews: some View {
        SessionItem(session: session)
    }
}
