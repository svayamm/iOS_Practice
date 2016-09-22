//
//  ViewController.swift
//  SimpleBrowser
//
//  Created by Svayam Mishra on 19/09/2016.
//  Copyright © 2016 Svayam Mishra. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate, UITextFieldDelegate {

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
        self.locationField.delegate = self
        let url = NSURL(string: "https://www.google.com/")
        webView.loadRequest(NSURLRequest(URL: url!))
        webView.allowsBackForwardNavigationGestures = true
        locationField.text = "www.google.com"
        locationField.becomeFirstResponder()
        locationField.selectedTextRange = locationField.textRangeFromPosition(locationField.beginningOfDocument, toPosition: locationField.endOfDocument)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
        presentViewController(alert, animated: true, completion: nil)
    } //  how to clear location field and reset focus?
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        locationField.resignFirstResponder()
        goToPage()
        return true
    }
    
    func goToPage() {
        let url = NSURL(string: "https://" + locationField!.text!)!
        webView.loadRequest(NSURLRequest(URL: url))
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    @IBAction func openPage(sender: UIBarButtonItem) {
        goToPage()
    }
    
    @IBAction func refreshTapped(sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func backTapped(sender: UIBarButtonItem) {
        webView.goBack()
    }
    
    @IBAction func forwardTapped(sender: UIBarButtonItem) {
        webView.goForward()
    }
    
    @IBAction func stopTapped(sender: UIBarButtonItem) {
        webView.stopLoading()
    }
}

