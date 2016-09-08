//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

import Foundation

let startTime: NSDate = NSDate()
let calendar = NSCalendar.currentCalendar()

let newYearsDayComponents = NSDateComponents()
newYearsDayComponents.year = 2015
newYearsDayComponents.month = 1
newYearsDayComponents.day = 1
let newYearsDay = calendar.dateFromComponents(newYearsDayComponents)!

let valentinesDayComponents = NSDateComponents()
valentinesDayComponents.year = 2015
valentinesDayComponents.month = 2
valentinesDayComponents.day = 14
valentinesDayComponents.hour = 9  // start the day at 9am for now
let valentinesDay = calendar.dateFromComponents(valentinesDayComponents)!

let diffVD2NYD = valentinesDay.timeIntervalSinceDate(newYearsDay)
let diffNYD2VD = newYearsDay.timeIntervalSinceDate(valentinesDay)

let diffDays = Int(diffVD2NYD / 86400)
let diffHours = Int((diffVD2NYD % 86400)/(3600))

let diffVD2NYDAsString: String = String(format: "%02d:%02d", diffDays, diffHours)

var elapsedTime = -1 * startTime.timeIntervalSinceNow


let toDayComponents = NSDateComponents()
toDayComponents.year = 2016
toDayComponents.month = 9
toDayComponents.day = 7
toDayComponents.hour = 23
let toDay = calendar.dateFromComponents(toDayComponents)!

var elapsedTime2 = -1 * toDay.timeIntervalSinceNow

print(elapsedTime2/60)

let diffMin = Int(elapsedTime2/60)


let diffSec = Int(elapsedTime2 - Double(diffMin*60))

let diffFrac = Int((elapsedTime2 - Double(diffSec+(diffMin*60)))*10)



let elapsedString: String = String(format: "%02d:%02d.%01d",diffMin, diffSec, diffFrac)





var tempUnits: String = "R" // love to Rankine (not really)
var newUnits: String = "C"

func swap() {
    (tempUnits, newUnits) = (newUnits, tempUnits)
}

swap(&tempUnits, &newUnits)

print(tempUnits)


swap(&tempUnits, &newUnits)

print(tempUnits)

