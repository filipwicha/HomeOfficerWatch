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
        VStack{
            Button(action: {self.basicViewModel.change()}){
                
                VStack{
                    Text(self.basicViewModel.timeStamp.relay ? "Stop working" : "Start working")
                        .foregroundColor(self.basicViewModel.timeStamp.relay ? .red : .green )
                    Text(self.basicViewModel.time.differenceString)
                        .font(.system(size: 15))
                        .bold()
                        .onReceive(timer) { _ in
                            if(self.basicViewModel.timeStamp.relay == true){
                                self.basicViewModel.changeTime()
                            }
                    }
                }.padding()
            }
            
            ZStack {
                Circle()
                    .stroke(lineWidth: 9.0)
                    .opacity(0.3)
                    .foregroundColor(self.basicViewModel.timeStamp.relay == true ? Color.green  : Color.red)
//                    .frame(width: 140, height: 140)
                
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.basicViewModel.time.percentOfRegularPost, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 9.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(self.basicViewModel.timeStamp.relay == true ? Color.green  : Color.red)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
//                    .frame(width: 140, height: 140)
                Text("💻").font(.system(size: 50))
            }.frame(width: 100, height: 100)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
