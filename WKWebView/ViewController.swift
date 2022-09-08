//
//  ViewController.swift
//  WKWebView
//
//  Created by Zeto on 2022/09/02.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func loadView() {
        super.loadView()
        setWebView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureWebViewURL()
    }
}

extension ViewController: WKUIDelegate, WKNavigationDelegate {
    
}

private extension ViewController {
    
    func setWebView() {
        webView.uiDelegate = self
        webView.navigationDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configureLayout() {
        view.addSubview(webView)
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
//
//    func configureWebViewURL() {
//        guard let url = URL(string: "https://m.officecheckin.com") else { return }
//
//        let request = URLRequest(url: url)
//        
//        // 자바스크립트 활성화
//        if #available(iOS 14, *) {
//            let preferences = WKWebpagePreferences()
//            preferences.allowsContentJavaScript = true
//            webView.configuration.defaultWebpagePreferences = preferences
//        } else {
//            webView.configuration.preferences.javaScriptEnabled = true
//        }
//
//        webView.load(request)
//    }
}
