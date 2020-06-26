//
//  ContentView.swift
//  HomeOfficerWatch WatchKit Extension
//
//  Created by Filip Wicha on 25/06/2020.
//  Copyright © 2020 Filip Wicha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var basicViewModel: BasicViewModel = BasicViewModel()
    @State var node = "Node1"
    @State var showAlert = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            Circle()
                    .stroke(lineWidth: 35.0)
                    .opacity(0.3)
                    .foregroundColor(self.basicViewModel.timeStamp.relay == true ? Color.green  : Color.red)
                    .frame(width: 300, height: 300)
                
            Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.basicViewModel.time.percentOfRegularPost, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 35.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(self.basicViewModel.timeStamp.relay == true ? Color.green  : Color.red)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                    .frame(width: 300, height: 300)
            VStack{
                Text(self.basicViewModel.timeStamp.uuid)
                    .opacity(0.5)
                    .font(.title)
                Text(self.basicViewModel.timeStamp.relay ? "You've been working for" : "Time your have worked")
                Text(self.basicViewModel.time.differenceString)
                        .font(.largeTitle)
                        .bold()
                        .onReceive(timer) { _ in
                            if(self.basicViewModel.timeStamp.relay == true){
                                self.basicViewModel.changeTime()
                            }
                        }
                Button(action: {self.basicViewModel.change()}){
                    VStack{
                        Text(self.basicViewModel.timeStamp.relay ? "Click to stop working" : "Click to start working")
                        .foregroundColor(self.basicViewModel.timeStamp.relay ? .red : .green )
                    Text("💻").font(.title)
                    }
                
                    }
                }
            }
            
        .frame(width: 340, height: 340)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
