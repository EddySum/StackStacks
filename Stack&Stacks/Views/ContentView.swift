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
        self.sessionService = SessionService.init()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Sessions(sessions: sessionService.sessions)
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
