//
//  WebView.swift
//  ios-webview-sample
//
//  Created by Milan Parađina on 13.12.2024..
//

import SwiftUI
import WebKit
import AVFoundation

struct WebView: UIViewRepresentable {
    let url: URL

    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "mediaCapture" {
                // Handle camera/microphone requests coming from the webpage
                requestCameraPermission()
            }
        }
        
        private func requestCameraPermission() {
            AVCaptureDevice.requestAccess(for: .video) { granted in
                if granted {
                    print("Camera access granted.")
                } else {
                    print("Camera access denied.")
                }
            }
        }
        
        var parent: WebView

        init(parent: WebView) {
            self.parent = parent
        }

        func webView(
            _ webView: WKWebView,
            decidePolicyFor navigationAction: WKNavigationAction,
            decisionHandler: @escaping (WKNavigationActionPolicy) -> Void
        ) {
            decisionHandler(.allow) // Allow all navigation actions
        }

        func webView(
            _ webView: WKWebView,
            runJavaScriptAlertPanelWithMessage message: String,
            initiatedByFrame frame: WKFrameInfo,
            completionHandler: @escaping () -> Void
        ) {
            // Handle JavaScript alerts here if needed
            completionHandler()
        }

        func webView(
            _ webView: WKWebView,
            runJavaScriptConfirmPanelWithMessage message: String,
            initiatedByFrame frame: WKFrameInfo,
            completionHandler: @escaping (Bool) -> Void
        ) {
            // Handle JavaScript confirm dialogs here
            completionHandler(true)
        }

        func webView(
            _ webView: WKWebView,
            runJavaScriptTextInputPanelWithPrompt prompt: String,
            defaultText: String?,
            initiatedByFrame frame: WKFrameInfo,
            completionHandler: @escaping (String?) -> Void
        ) {
            // Handle JavaScript input panels here
            completionHandler(defaultText)
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            decisionHandler(.allow)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let webViewConfiguration = WKWebViewConfiguration()
        
        // Configure the WebView for media playback
        webViewConfiguration.allowsInlineMediaPlayback = true
        webViewConfiguration.allowsPictureInPictureMediaPlayback = true
        webViewConfiguration.allowsAirPlayForMediaPlayback = true

        // Set up media capture permissions
        webViewConfiguration.mediaTypesRequiringUserActionForPlayback = .all
        webViewConfiguration.userContentController.add(context.coordinator, name: "mediaCapture")
        
        let webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        webView.load(URLRequest(url: url))

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Update WebView content if needed
    }
}
