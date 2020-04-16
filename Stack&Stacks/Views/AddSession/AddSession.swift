//
//  AddSession.swift
//  Stack&Stacks
//
//  Created by eddySum on 4/12/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct AddSession: View {
    var body: some View {
        VStack {
            Divider()
            AddSessionInput(option: "Game Type", selected: "Cash")
            AddSessionInput(option: "Start Time", selected: "April 16, 2020")
            AddSessionInput(option: "Buy In", selected: "25")
            AddSessionInput(option: "Blinds", selected: "$0.25/$0.50")
            
            
            Spacer()
        }
        .padding(.top, 50)
        .navigationBarTitle(Text("Add Session"), displayMode: .inline)
    }
}

struct AddSession_Previews: PreviewProvider {
    static var previews: some View {
        AddSession()
    }
}
