//
//  UrlNavigation.swift
//  2012_AlertControler
//
//  Created by mamidisetty Vikash on 06/03/21.
//

import UIKit
import WebKit

class UrlNavigation: UIViewController , WKNavigationDelegate{
    var myWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        myWebView = WKWebView()
        myWebView.navigationDelegate = self
            view = myWebView
    }
    

  
}
