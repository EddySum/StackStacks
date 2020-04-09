//
//  Sessions.swift
//  Stack&Stacks
//
//  Created by Adnan Sumra on 3/5/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct Sessions: View {
    var sessions: [Session];

    
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
                    
                        SessionItem(session: sessions[0])
                       
                        
                       Spacer()
                    }
                )
            
            
            Spacer()
            
        }
    }
}

struct Sessions_Previews: PreviewProvider {
    static var previews: some View {
        Sessions(sessions: [sessionSeed, sessionSeed])
    }
}
