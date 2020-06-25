//
//  BasicViewModel.swift
//  HomeOfficerWatch
//
//  Created by Filip Wicha on 25/06/2020.
//  Copyright © 2020 Filip Wicha. All rights reserved.
//

import Foundation

class BasicViewModel: ObservableObject {
    
    @Published var timeStamp: TimeStampViewModel = TimeStampViewModel(timeStamp: TimeStamp(id: 0, uuid: "Node1", relay: false, power_switch: false, date: "2000-01-01T00:00:00.000Z"))
//    = TimeStampViewModel(TimeStamp(id: 0, uuid: "Node1", relay: false, power_switch: false, date: "2000-01-01T00:00:00.000Z"))
    
    @Published var time = "00:00"

    init() {
        check()
    }
    
    func check() {
        
        Webservice().check { timeStamp in
            if let timeStamp = timeStamp {
                self.timeStamp = TimeStampViewModel.init(timeStamp: timeStamp)
            } else {
                self.timeStamp = TimeStampViewModel.init(timeStamp: TimeStamp(id: 0, uuid: "Node1", relay: false, power_switch: false, date: "2000-01-01T00:00:00.000Z"))
            }
        }
    }
    
    func change() {
        
        Webservice().change { timeStamp in
            if let timeStamp = timeStamp {
                self.timeStamp = TimeStampViewModel.init(timeStamp: timeStamp)
            }
        }
    }
    
    func getTime() {

        let difference = Calendar.current.dateComponents([.hour, .minute, .second], from: timeStamp.date, to: Date())
        let formattedString = String(format: "%02ld:%02ld:%02ld", difference.hour! - 2 /* "-2" because of the timezone change between server */, difference.minute!,  difference.second!)
        self.time = formattedString
    }
    
    
}

class TimeStampViewModel {
    
    var timeStamp: TimeStamp
    
    init(timeStamp: TimeStamp){
        self.timeStamp = timeStamp
    }
    
    var id: Int {
        return self.timeStamp.id
    }

    var power_switch: Bool {
        return self.timeStamp.power_switch
    }

    var relay: Bool {
        return self.timeStamp.relay
    }

    var uuid: String {
        return self.timeStamp.uuid
    }

    var dateString: String {
        return self.timeStamp.date
    }

    var date: Date {
        return toDate(isoDate: self.timeStamp.date)
    }
      
    func toDate(isoDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        let date = dateFormatter.date(from:isoDate)
        return date ?? Date()
    }
}



