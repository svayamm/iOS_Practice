//
//  ViewController.swift
//  Stopwatch
//
//  Created by Svayam Mishra on 07/09/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let stopwatch = Stopwatch()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func startButtonTapped(sender: UIButton) {
        // code to start the clock
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(ViewController.updateElapsedTimeLabel(_:)), userInfo: nil, repeats: true)
        stopwatch.start()
    }
    
    @IBAction func stopButtonTapped(sender: UIButton) {
        // code to stop the clock
        stopwatch.stop()
    }
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    func updateElapsedTimeLabel(timer: NSTimer) {
        if stopwatch.isRunning {
            elapsedTimeLabel.text = stopwatch.elapsedTimeAsString
        } else {
            timer.invalidate()
        }
    }
    
}

