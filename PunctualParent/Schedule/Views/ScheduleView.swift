//
//  ScheduleView.swift
//  PunctualParent
//
//  Created by Elvin Bearden on 8/10/20.
//  Copyright © 2020 Elvin Bearden. All rights reserved.
//

import SwiftUI

struct ScheduleView: View {
    @ObservedObject private var viewModel: ScheduleViewModel
    @State private var hasStarted = false
    
    init() {
        self.viewModel = ScheduleViewModel()
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.datasource, id: \.id) { item in
                ScheduleRow(viewModel: ScheduleRowViewModel(item: item))
            }
            .navigationBarTitle("Today's Schedule")
            .navigationBarItems(trailing:
                Button(self.hasStarted ? "Edit" : "Start") {
                    if !self.hasStarted {
                        self.hasStarted = true
                        self.viewModel.start()
                    } else {
                        print("Show edit screen or picker")
                    }
                }.font(.callout)
            )
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
