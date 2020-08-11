//
//  HostingController.swift
//  PunctualParentWatchApp Extension
//
//  Created by Elvin Bearden on 8/10/20.
//  Copyright © 2020 Elvin Bearden. All rights reserved.
//

import WatchKit
import Foundation
import SwiftUI

class HostingController: WKHostingController<ContentView> {
    override var body: ContentView {
        return ContentView()
    }
}

struct HostingController_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
