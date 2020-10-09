//
//  Created by TopHeading
//  Copyright © TopHeading All rights reserved.
//  Created on 09/10/20


import UIKit
import WebKit
import SVProgressHUD

class LoadWebVC: UIViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: - Private Properties
    
    // MARK: - Public Properties
    public var webLink: String?
    
    // MARK: - View Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureOnViewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        SVProgressHUD.dismiss()
    }
    
    // MARK: - Private Methods
    
    private func configureOnViewDidLoad() {
        webView.backgroundColor = UIColor.white
        if let strUrl = webLink, let url = URL(string: strUrl) {
            let request = URLRequest(url: url)
            webView.navigationDelegate = self
            webView.load(request)
            webView.allowsBackForwardNavigationGestures = true
        }
    }
    
    // MARK: - Button Action Methods
    
    /// Button Action method for Close
    /// - Parameter sender: Object of the Button
    @IBAction func btnCloseButtonTaped(_: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - WKNavigationDelegate
extension LoadWebVC: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        SVProgressHUD.show(withStatus: "Loading...")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        SVProgressHUD.dismiss()
    }
}

