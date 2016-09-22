//
//  ViewController.swift
//  SimpleBrowser
//
//  Created by Svayam Mishra on 19/09/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var locationField: UITextField!
    var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let url = NSURL(string: "https://www.google.com/")
        webView.loadRequest(NSURLRequest(URL: url!))
        webView.allowsBackForwardNavigationGestures = true
        locationField.text = "www.google.com"
        locationField.selectedTextRange = locationField.textRangeFromPosition(locationField.beginningOfDocument, toPosition: locationField.endOfDocument)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

