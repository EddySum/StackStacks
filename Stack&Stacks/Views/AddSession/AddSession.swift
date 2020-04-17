//
//  AddSession.swift
//  Stack&Stacks
//
//  Created by eddySum on 4/12/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct AddSession: View {
    @State var startTime = Date()
    @State var blindsIndex = 0
    @State var gameTypeIdx = 0
    @State private var buyIn = "25.00"
    
    var blinds = ["$0.25/ $0.25", "$0.50/ $1.00"]
    var gameTypes = ["Cash", "Tournament"]
    
    
    var body: some View {
        VStack {
            Form {
                DatePicker("Start Date", selection: $startTime)
                
                Picker(selection: $blindsIndex, label: Text("Blinds")) {
                    ForEach(0 ..< blinds.count) {
                        Text(self.blinds[$0])
                    }
                }
                
                Picker(selection: $gameTypeIdx, label: Text("Game Type")) {
                    ForEach(0 ..< gameTypes.count) {
                        Text(self.gameTypes[$0])
                    }
                }
                
                
                Section (header: Text("Buy In")) {
                    TextField("Buy In", text: Binding(
                        get: { self.buyIn },
                        set: { (userInp) in
                            if (userInp.prefix(1) != "$") {
                                self.buyIn = "$\(userInp)"
                            } else {
                                self.buyIn = userInp
                            }
                    }))
                        .keyboardType(.decimalPad)
                }
                
                Section {
                    Button(action: {}) {
                      Text("Create Session")
                    }
                }
            }
        }
        .navigationBarTitle(Text("Add Session"), displayMode: .inline)
    }
}

struct AddSession_Previews: PreviewProvider {
    static var previews: some View {
        AddSession()
    }
}
