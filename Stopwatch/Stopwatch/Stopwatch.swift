import Foundation

class Stopwatch {
    
    private var startTime: NSDate?
    
    func start() {
        startTime = NSDate()
    }
    
    func stop() {
        startTime = nil // it's not giving an error?
    }
    var elapsedTime: NSTimeInterval {
        if let startTime = self.startTime {
            return -1 * startTime.timeIntervalSinceNow // could also just say -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    var elapsedTimeAsString: String {
        // return the formatted string...
        let diffMin = Int(elapsedTime/60)
        print(diffMin)
        let diffSec = Int(elapsedTime - Double(diffMin*60))
        print(diffSec)
        let diffFrac = Int((elapsedTime - Double(diffSec+(diffMin*60)))*10)
        return String(format: "%02d:%02d.%01d",diffMin, diffSec, diffFrac)
    }
    var isRunning: Bool {
        return startTime != nil
    }
    
}