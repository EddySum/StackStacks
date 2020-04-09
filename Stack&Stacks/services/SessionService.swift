//
//  sessions.swift
//  Stack&Stacks
//
//  Created by eddySum on 4/9/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import Foundation
import FirebaseFirestore

class SessionService: ObservableObject {
    @Published var sessions: [Session] = []
    
    init() {
        let sessionCollection = Firestore.firestore().collection("sessions");
        
        sessionCollection.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let session = Session.init(data: document.data())!
                    self.sessions.append(session)
                    //print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
}
