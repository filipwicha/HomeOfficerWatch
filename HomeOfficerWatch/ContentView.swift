//
//  ContentView.swift
//  HomeOfficerWatch
//
//  Created by Filip Wicha on 25/06/2020.
//  Copyright © 2020 Filip Wicha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var basicViewModel: BasicViewModel = BasicViewModel()

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack{
            Text(self.basicViewModel.time).onReceive(timer) { _ in
                self.basicViewModel.getTime()
            }
            
            Button(action: {
                self.basicViewModel.change()
            }) {
               Text("Click me")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.colorScheme, .dark)
    }
}
