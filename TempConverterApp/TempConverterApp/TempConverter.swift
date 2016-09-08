//
//  TempController.swift
//  TempConverterApp
//
//  Created by Svayam Mishra on 08/09/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import Foundation

class TempConverter {
    
    var inputTemp: Int = 0
    var convertedTemp: Int = 0
    var convertedTempDisplay: String = "0"
    var tempUnits: String = "°F"
    var newUnits: String = "°C"
    
    func convert() {
        
        // logic for converting temps and setting display string
        // must check that the temp is valid (above absolute zero)
        // if temp is not valid, display string should be set to 'N/A'
        
        if tempIsValid() {
            
            if tempUnits == "°F" {
                convertedTemp = 5 * (inputTemp - 32)/9
                convertedTempDisplay = String(convertedTemp)
            } else {
                convertedTemp = (9*inputTemp)/5 + 32
                convertedTempDisplay = String(convertedTemp)
            }
        }
        else {
            convertedTempDisplay = "N/A"
        }
    }
    
    func tempIsValid() -> Bool {
        
        // test to make sure above absolute zero for either Fahrenheit or Celsius
        
        return (inputTemp < -458 && tempUnits == "°F") || (inputTemp < -274 && tempUnits == "°C")
        
    }
    
    func toggleUnits() {
        
        // switch the state of tempUnits and newUnits

        (tempUnits, newUnits) = (newUnits, tempUnits)
        
    }  
}