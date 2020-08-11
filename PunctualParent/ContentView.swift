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
                        Image("first")
                        Text("Home")
                    }
                }
                .tag(0)
            ScheduleView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Schedule")
                    }
                }
                .tag(1)
            Text("Silent Alarm")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Silent Alarm")
                    }
                }
                .tag(2)
            Text("Sleep")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Sleep")
                    }
                }
                .tag(3)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
