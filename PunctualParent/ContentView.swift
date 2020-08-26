//
//  ContentView.swift
//  PunctualParent
//
//  Created by Elvin Bearden on 8/10/20.
//  Copyright © 2020 Elvin Bearden. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection) {
            Text("Home")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("Home")
                    }
                }
                .tag(0)
            ScheduleView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "calendar")
                        Text("Schedule")
                    }
                }
                .tag(1)
            Text("Silent Alarm")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "timer")
                        Text("Silent Alarm")
                    }
                }
                .tag(2)
            TrackerView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "clock")
                        Text("Sleep")
                    }
                }
                .tag(3)
        }.accentColor(.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
