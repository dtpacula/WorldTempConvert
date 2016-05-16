//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Derek Pacula on 5/16/16.
//  Copyright © 2016 Derek Mobile Design. All rights reserved.
//

import UIKit
import WebKit
class WebViewController: UIViewController {
    var webView: WKWebView!
    override func loadView() {
        let url = NSURL(string: "https://bignerdranch.com")!
        webView = WKWebView()
        webView.loadRequest(NSURLRequest(URL: url))
        view = webView
    }
    override func viewDidLoad() {
        print("WebViewController loaded its view.")
    }
}