//
//  statsService.swift
//  Stack&Stacks
//
//  Created by eddySum on 5/2/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import FirebaseFirestore

class StatsService: ObservableObject {
    let sessions: [Session]
    var sessionCount: Int = 0;
    var netProfit: Double = 0.0;
    var totalTime: TimeInterval = 0.0
    var profitPerHour: TimeInterval = 0.0
    var avgSessionDuration: TimeInterval = 0.0
    
    init(sessions: [Session]) {
        self.sessions = sessions.filter { $0.endTime != nil }
        
        if (self.sessions.count > 0) {
            calcStats();
        }
    }
    
    private func calcStats() {
        sessionCount = self.sessions.count;
    
        // REDUCE: add netProfits from sessions
        self.netProfit = self.sessions.reduce(0.0, { (total:Double, session:Session) -> Double in
            return total + session.netProfit
        })
        
        
        self.totalTime = self.sessions.reduce(0.0, { (total:Double, session:Session) -> TimeInterval in
            if let endTime = session.endTime {
                let elapsedSessionTime = endTime.timeIntervalSince(session.startTime)
                return total + elapsedSessionTime
            }
            return 0.0
        })
        
        self.avgSessionDuration = (self.totalTime / Double(self.sessionCount))
        
        self.profitPerHour = self.netProfit / (self.totalTime / (60 * 60))
    }
    

}
