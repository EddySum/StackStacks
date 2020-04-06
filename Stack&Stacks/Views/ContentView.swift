//
//  ContentView.swift
//  Stack&Stacks
//
//  Created by Adnan Sumra on 2/20/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    init() {
        let sessionSeed = Session.init(
            type: SessionTypes.Cash,
            buyIn: 25,
            startTime: Date.init()
        )
    }
    
    var body: some View {
        
        VStack {
            Sessions(sessions: [])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
