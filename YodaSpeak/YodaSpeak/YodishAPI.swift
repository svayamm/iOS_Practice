//
//  YodaSpeak.swift
//  YodaSpeak
//
//  Created by Svayam Mishra on 05/10/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import Foundation

class YodishAPI {

    func request(input: String) -> String {
        if input != "" {
            let input = input.stringByReplacingOccurrencesOfString(" ", withString: "+", options: NSStringCompareOptions.LiteralSearch, range: nil)
            let url = NSURL(string: "https://yoda.p.mashape.com/yoda?sentence=\(input)")
            let request = NSMutableURLRequest(URL: url!)
            request.HTTPMethod = "GET"
            request.setValue("b6DXOx972SmshhUwaSS3Luzg7dpqp16hL3WjsnlCVM8MOFW8x5", forHTTPHeaderField: "X-Mashape-Key")
            var response: NSURLResponse?
            let error: NSErrorPointer = nil
            var data: NSData?
            do {
                data = try NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
            } catch let error1 as NSError {
                error.memory = error1
                data = nil
            }
            // ensure that the API call was successful
            if data == nil {
                return "ERROR: API request failed; make sure the URL is correct"
            }
            let reply = NSString(data: data!, encoding: NSUTF8StringEncoding)
            // check that the returned data is valid
            if reply == "{\"message\":\"Invalid Mashape Key\"}" {
                return "ERROR: API key is not valid"
            } else {
                return String(reply!)
            }
        }
        else {
            return "ERROR: sentence provided is blank"
        }
    }

}
