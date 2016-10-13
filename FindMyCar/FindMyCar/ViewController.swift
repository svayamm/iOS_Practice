//
//  ViewController.swift
//  FindMyCar
//
//  Created by Svayam Mishra on 12/10/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var storedLocation = Location()

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "MainToMap"
        {
            if let destinationVC = segue.destinationViewController as?  MapViewController {
                destinationVC.carLocation = storedLocation
            }
        }
    }
    
    @IBAction func setLocation(sender: UIButton) {
        storedLocation.getCurrentLocation()
        let alert = UIAlertController(title: "Car Location Saved", message: generateMessage(), preferredStyle: .Alert)
        presentViewController(alert, animated: true, completion: nil)
        alert.addAction(UIAlertAction(title: "Back", style: .Default, handler: { action in
            self.viewDidLoad()
        })) // handler allows to reset
    }
    
    func generateMessage() -> String {
        let message = "Your car is currently at: \n( \(storedLocation.latitude), \(storedLocation.longitude) )\n\nWhen you want a map to this location, simply press the 'Where is my car?' button."
        return message
    }
}

