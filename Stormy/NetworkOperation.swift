//
//  NetworkOperation.swift
//  Stormy
//
//  Created by Teodor on 11/02/16.
//  Copyright © 2016 TeodorGarzdin. All rights reserved.
//

import Foundation

class NetworkOperation {
    lazy var config: URLSessionConfiguration = URLSessionConfiguration.default()
    lazy var session: URLSession = URLSession(configuration: self.config)
    let queryURL: URL
    
    typealias JSONDictionaryCompletion = ([String: AnyObject]?) -> Void
    
    init(url: URL) {
        self.queryURL = url
    }
    
    func downloadJSONFromURL(_ completion: JSONDictionaryCompletion) {
        let request: URLRequest = URLRequest(url: queryURL)
        let dataTask = session.dataTask(with: request) {
            (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                switch(httpResponse.statusCode) {
                case 200:
                    let JSONDictionary = try? JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                    completion(JSONDictionary!)
                default:
                    print("GET request not successful. Status code: \(httpResponse.statusCode)")
                }
            } else {
                print("Error: Not a valid HTTP response")
            }
        }
        dataTask.resume()
    }
}
