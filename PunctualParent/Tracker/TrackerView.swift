//
//  TrackerView.swift
//  PunctualParent
//
//  Created by Elvin Bearden on 8/12/20.
//  Copyright © 2020 Elvin Bearden. All rights reserved.
//

import SwiftUI

struct TrackerView: View {
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Today")) {
                        HStack {
                            Text("1hr 25m")
                                .font(Font.system(size: 20))
                                .bold()
                            Spacer()
                            VStack {
                                Text("7:00 AM")
                                Text("8:25 AM")
                            }
                        }
                        .frame(height: 40.0)
                        HStack {
                            Text("3hr")
                                .font(Font.system(size: 20))
                                .bold()
                            Spacer()
                            VStack {
                                Text("7:00 AM")
                                Text("8:25 AM")
                            }
                        }
                        .frame(height: 40.0)
                        HStack {
                            Text("25m")
                                .font(Font.system(size: 20))
                                .bold()
                            Spacer()
                            VStack {
                                Text("7:00 AM")
                                Text("8:25 AM")
                            }
                        }
                    }
                    .frame(height: 40.0)
                    Section (header: Text("12/15/2020")) {
                        HStack {
                            Text("1hr 25m")
                                .font(Font.system(size: 30))
                                .bold()
                            Spacer()
                            VStack {
                                Text("7:00 AM")
                                Text("8:25 AM")
                            }
                        }
                        .frame(height: 40.0)
                        HStack {
                            Text("3hr")
                                .font(Font.system(size: 30))
                                .bold()
                            Spacer()
                            VStack {
                                Text("7:00 AM")
                                Text("8:25 AM")
                            }
                        }
                        .frame(height: 40.0)
                        HStack {
                            Text("25m")
                                .font(Font.system(size: 30))
                                .bold()
                            Spacer()
                            VStack {
                                Text("7:00 AM")
                                Text("8:25 AM")
                            }
                        }
                        .frame(height: 40.0)
                    }
                }
                Text("07:29:30")
                    .padding()
                Button("Start") {
                    
                }
                .frame(width: UIScreen.main.bounds.width - 50, height: 50)
                .background(Color.orange)
                .foregroundColor(.white)
                .font(.headline)
                .cornerRadius(25)
            }
            .navigationBarTitle("Sleep Tracker")
        }
    }
}

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}
