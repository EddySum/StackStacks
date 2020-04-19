//
//  ContentView.swift
//  Stack&Stacks
//
//  Created by Adnan Sumra on 2/20/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 1
    
    init() {
        
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                Text("Stats")
                .navigationBarTitle(Text("Stats"), displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "1.square.fill")
                Text("Stats")
            }
            .tag(0)
            NavigationView {
               Sessions()
                .navigationBarTitle(Text("Home"), displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "tv.fill")
                Text("Home")
            }
            .tag(1)
            NavigationView {
                Text("Profile")
                .navigationBarTitle(Text("Profile"), displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "3.square.fill")
                Text("Profile")
            }
            .tag(2)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
