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
    let sessionCollection = Firestore.firestore().collection("sessions");
    
    init() {
        getAllSessions();
    }
    
    func getAllSessions() {
        let sessionCollection = Firestore.firestore().collection("sessions");
        
        sessionCollection.order(by: "startTime", descending: true).getDocuments()
         { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let session = Session.init(data: document.data())!
                    self.sessions.append(session)
                }
            }
        }
    }
    
    func createSession() {
        var ref: DocumentReference? = nil
        ref = sessionCollection.addDocument(data: [
            "buyIns": [5,25],
            "startTime": Date.init(),
            "totalExpense": 30,
            "type": "cash"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
    }
    
    
}
