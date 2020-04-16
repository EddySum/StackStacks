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
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                 Text("Game Type")
                 Text("Cash")
                    .foregroundColor(Color.gray)
                }
                .padding(.leading)
                Spacer()
                Image(systemName: "chevron.right")
                    .padding(.trailing)
            }
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                 Text("Start Time")
                 Text("April 16, 2020")
                    .foregroundColor(Color.gray)
                }
                .padding(.leading)
                Spacer()
                Image(systemName: "chevron.right")
                    .padding(.trailing)
            }
            Divider()

            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                 Text("Buy In")
                 Text("25")
                    .foregroundColor(Color.gray)
                }
                .padding(.leading)
                Spacer()
                Image(systemName: "chevron.right")
                    .padding(.trailing)
            }
            Divider()
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                 Text("Blinds")
                 Text("$0.25/$0.50")
                    .foregroundColor(Color.gray)
                }
                .padding(.leading)
                Spacer()
                Image(systemName: "chevron.right")
                    .padding(.trailing)
            }
            Divider()
            
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
