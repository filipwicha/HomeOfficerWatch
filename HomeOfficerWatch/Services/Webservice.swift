//
//  Webservice.swift
//  CoffeeOrderingApp
//
//  Created by Mohammad Azam on 8/20/19.
//  Copyright © 2019 Mohammad Azam. All rights reserved.
//

import Foundation

class Webservice {
    
    func change(completion: @escaping (TimeStamp?) -> ()) {
        
        guard let url = URL(string: "https://homeofficer.herokuapp.com/status/change") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let timeStamp = try? JSONDecoder().decode(TimeStamp.self, from: data)
            DispatchQueue.main.async {
                completion(timeStamp)
            }
        }.resume()
    }
    
    func check(completion: @escaping (TimeStamp?) -> ()) {
        
        guard let url = URL(string: "https://homeofficer.herokuapp.com/status/check") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            
            let timeStamp = try? JSONDecoder().decode(TimeStamp.self, from: data)
            DispatchQueue.main.async {
                completion(timeStamp)
            }
        }.resume()
    }
}
