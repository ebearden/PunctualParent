//
//  ScheduleView.swift
//  PunctualParent
//
//  Created by Elvin Bearden on 8/10/20.
//  Copyright © 2020 Elvin Bearden. All rights reserved.
//

import SwiftUI

enum ScheduleType {
    case snack, milk, meal, nap
}

struct ScheduleItem: Identifiable {
    typealias ID = Int
    
    var id: Int
    let type: ScheduleType
    let name: String
    let startTime: Date
}

struct ScheduleRowViewModel {
    let item: ScheduleItem
    
    var formattedStartTime: String {
        return formatter.string(from: item.startTime)
    }
    
    var backgroundColor: Color {
        switch item.type {
        case .nap:
            return .orange
        case .snack:
            return .purple
        case .milk:
            return .blue
        case .meal:
            return .green
        }
    }
    
    private var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        return formatter
    }
}

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
            HStack  {
                Text(viewModel.formattedStartTime)
                    .foregroundColor(.white)
                    .font(.body)
                    .bold()
                    .padding()
                Spacer()
                Button(action: {
                    print("Edit")
                }) {
                    Text("edit")
                        .font(.system(size: 12))
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.white)

                }
            }
        }
        .background(viewModel.backgroundColor)
        .cornerRadius(10)
    }
}

struct ScheduleView: View {
    let datasource = [
        ScheduleItem(id: 0, type: .snack, name: "Snack", startTime: Date()),
        ScheduleItem(id: 1, type: .nap, name: "Nap", startTime: Date()),
        ScheduleItem(id: 2, type: .milk, name: "Milk", startTime: Date()),
        ScheduleItem(id: 3, type: .meal, name: "Lunch", startTime: Date())
    ]
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List(datasource, id: \.id) { item in
                ScheduleRow(viewModel: ScheduleRowViewModel(item: item))
            }
            .navigationBarTitle("Today's Schedule")
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
