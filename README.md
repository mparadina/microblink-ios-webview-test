# Microblink iOS WebView Test

## Intro

This repo shows a basic POC for running Microblink's BlinkID using SwiftUI and WebView 

- The application only consists of one view (WebView)
- Loads the web demo site https://blinkid-test.netlify.app/ into the browser
- Asks for camera permission when entering the scanning process and is making sure that scanning and extraction work

## Requirements

In order for the WebView to work, there are a few items that need to be addressed first.

1. Add the [NSCameraUsageDescription](https://developer.apple.com/documentation/bundleresources/information-property-list/nscamerausagedescription) to your Info.plist file. This is important as the camera scanning will not work if the end-user declines the alert pop-up.

2. Add the additional permissions when setting up WebView:
```
webViewConfiguration.allowsInlineMediaPlayback = true
webViewConfiguration.allowsPictureInPictureMediaPlayback = true
webViewConfiguration.allowsAirPlayForMediaPlayback = true
        
webViewConfiguration.userContentController.add(context.coordinator, name: "mediaCapture")
        
let webView = WKWebView(frame: .zero, configuration: webViewConfiguration)
```
3. Display the camera permission alert when the mediaCapute event is triggered:
```
func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
    if message.name == "mediaCapture" {
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
```

## Conclusion
Hope this helps, and if you'll have any additional questions, please [reach out](https://microblink.com/contact-us/) to us and we'll be happy to help.
