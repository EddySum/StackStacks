//
//  Stats.swift
//  Stack&Stacks
//
//  Created by eddySum on 5/1/20.
//  Copyright © 2020 Adnan Sumra. All rights reserved.
//

import SwiftUI

// struct for formatting total time | Move to sepearte file to use in other areas
struct ElapsedTimeFormat {
    let hours: Int
    let minutes: Int
    let seconds: Int

    init(duration: TimeInterval) {
        self.hours = Int((duration / 60) / 60)
        self.minutes = Int((duration / 60).truncatingRemainder(dividingBy: 60))
        self.seconds = Int((duration).truncatingRemainder(dividingBy: 60))
    }
}

struct Stats: View {
    @ObservedObject var statService: StatsService
    var totalTime: ElapsedTimeFormat
    var avgSessionDuration: ElapsedTimeFormat
    
    init(sessions: [Session]) {
        let statService = StatsService.init(sessions: sessions)
        self.totalTime = ElapsedTimeFormat.init(duration: statService.totalTime)
        self.avgSessionDuration = ElapsedTimeFormat.init(duration: statService.avgSessionDuration)
        
        self.statService = statService
    }
    
    var body: some View {
        VStack {
             VStack(spacing: 18)  {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Sessions")
                        Text("# of Sessions")
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Text("\(statService.sessionCount)")
                }.padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Net Profit")
                        Text("Total profit over time")
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Text("$\(statService.netProfit, specifier: "%.2f")")
                }.padding(.horizontal)
                
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Total Hours")
                        Text("Total number of hours Played")
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Text("\(self.totalTime.hours)h, \(self.totalTime.minutes)m")
                }.padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Total Duration")
                        Text("Average session Duration")
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Text("\(self.avgSessionDuration.hours)h \(self.avgSessionDuration.minutes)m")
                }.padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Profit per hour")
                        Text("Average profit per hour")
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Text("$\(statService.profitPerHour, specifier: "%.2f")")
                }.padding(.horizontal)
            }
        }
    }
}
