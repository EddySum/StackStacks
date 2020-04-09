//
//  ContentView.swift
//  Stack&Stacks
//
//  Created by Adnan Sumra on 2/20/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var sessionService: SessionService
  
    init() {
        sessionService = SessionService.init()
    }
    
    var body: some View {
        VStack {
            Sessions(sessions: sessionService.sessions)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
