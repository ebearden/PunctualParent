//
//  ScheduleRow.swift
//  PunctualParent
//
//  Created by Elvin Bearden on 8/11/20.
//  Copyright © 2020 Elvin Bearden. All rights reserved.
//

import SwiftUI

struct ScheduleRow: View {
    let viewModel: ScheduleRowViewModel
    
    init(viewModel: ScheduleRowViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            Text(viewModel.item.name)
                .bold()
                .padding(.top, 5)
                .font(.subheadline)
                .foregroundColor(.white)
            
            HStack {
                Text(viewModel.formattedStartTime)
                    .foregroundColor(.white)
                    .font(.body)
                    .bold()
                    .padding()
                Spacer()
            }
        }
        .background(viewModel.backgroundColor)
        .cornerRadius(10)
    }
}

struct ScheduleRow_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleRow(viewModel: ScheduleRowViewModel(item: ScheduleItem(
            id: 0,
            type: .wake,
            name: "Wake up",
            startTime: Date())
        ))
    }
}
