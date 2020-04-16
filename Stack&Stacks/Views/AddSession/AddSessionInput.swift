//
//  AddSessionInput.swift
//  Stack&Stacks
//
//  Created by eddySum on 4/16/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

struct AddSessionInput: View {
    let option: String;
    let selected: String;
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                 Text(option)
                 Text(selected)
                    .foregroundColor(Color.gray)
                }
                .padding(.leading)
                Spacer()
                Image(systemName: "chevron.right")
                    .padding(.trailing)
            }
            Divider()
        }
        
    }
}

