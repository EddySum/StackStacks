//
//  sessions.swift
//  Stack&Stacks
//
//  Created by eddySum on 4/9/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import Combine
import FirebaseFirestore

class SessionService: ObservableObject {
    @Published var sessions: [Session] = []
    let sessionCollection = Firestore.firestore().collection("sessions")
    
    var cancellables = [AnyCancellable]()
    
    init() {
        getAllSessions()
        
    }
    
    func getAllSessions() {
        let sessionCollection = Firestore.firestore().collection("sessions");
        
        sessionCollection.order(by: "startTime", descending: true).getDocuments()
         { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let session = Session.init(data: document.data(), docRef: document.reference)!
                    self.sessions.append(session)
                    self.initListenForChange(session: session)
                }
            }
        }
    }
    
    func createSession(data: [String: Any]) {
        var ref: DocumentReference? = nil
        ref = sessionCollection.addDocument(data: data) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                if let session = Session.init(data: data, docRef: ref!) {
                    self.sessions.insert(session, at: 0)
                    self.initListenForChange(session: session)
                }
            }
        }
    }
    
    /* Temp fix having sessions observable object publish update on indivdual session change */
    // TODO Optimization: Only listen for changes when session detail view is on screen.
    private func initListenForChange(session: Session) {
        let cancel = session.objectWillChange.sink(receiveValue: {
         self.objectWillChange.send()
        })

        // Storing Cancellables object to stop deallaction, o/w Listener would be removed
        self.cancellables.append(cancel)
    }
    
    
}
