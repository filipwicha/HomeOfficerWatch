//
//  HostingController.swift
//  HomeOfficerWatch WatchKit Extension
//
//  Created by Filip Wicha on 25/06/2020.
//  Copyright © 2020 Filip Wicha. All rights reserved.
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
