//
//  AddSession.swift
//  Stack&Stacks
//
//  Created by eddySum on 4/12/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

struct AddSession: View {
    @ObservedObject var sessionService: SessionService
    @Binding var showView: Bool
    
    @State var startTime = Date()
    @State var blindsIndex = 0
    @State var gameTypeIdx = 0
    @State var locationIdx = 0
    @State private var buyIn = "25.00"
    @State private var playerCount = 1

    var blinds = ["$0.25/ $0.25", "$0.50/ $1.00"]
    var gameTypes = ["Cash", "Tournament"]
    var locations = ["My House", "Mohegan Sun Casino", "Foxwoods Casino", "Twin River Casino"]
    
    
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
                
                Picker(selection: $locationIdx, label: Text("Location")) {
                    ForEach(0 ..< locations.count) {
                        Text(self.locations[$0])
                    }
                }
                
                Section (header: Text("Buy In")) {
                    TextField("Buy In", text: Binding(
                        get: { "$\(self.buyIn)" },
                        set: { (userInp) in
                            self.buyIn = userInp.filter("0123456789.".contains)
                    }))
                        .keyboardType(.decimalPad)
                }
                
                Section (header: Text("Number of Players")) {
                    TextField("Number of Players", text: Binding(
                        get: { "\(self.playerCount)" },
                        set: { (userInp) in
                            if let playerCount = Int(userInp) {
                                self.playerCount = playerCount
                            }
                    }))
                        .keyboardType(.numberPad)
                }
                
                Section {
                    Button(action: {
                        self.createSession()
                        self.showView = false
                    }) {
                      Text("Create Session")
                    }
                }
            }
        }
        .navigationBarTitle(Text("New Session"), displayMode: .inline)
    }
    
    func createSession() {
        if let buyIn = Double(self.buyIn) {
            let data = ["startTime": startTime, "type": gameTypes[gameTypeIdx], "buyIns": [buyIn], "totalExpense": buyIn, "playerCount": playerCount, "blinds": blinds[blindsIndex], "location": locations[locationIdx]] as [String : Any]
            
            self.sessionService.createSession(data: data)
        }
    }
}
