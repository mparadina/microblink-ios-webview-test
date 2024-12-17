# Microblink iOS WebView Test

## Intro

This repo shows a basic POC for running Microblink's BlinkID using SwiftUI and SFSafariViewController 

- The application only consists of SFSafariViewController (`SafariViewController.swift`) and the Conent view (`ConentView.swift`) which displays it.
- Loads the web demo site https://blinkid-test.netlify.app/ into the browser
- Asks for camera permission when entering the scanning process and is making sure that scanning and extraction work

## Requirements

In order for the SFSafariViewController to work, you only need to add the [NSCameraUsageDescription](https://developer.apple.com/documentation/bundleresources/information-property-list/nscamerausagedescription) to your Info.plist file. This is important as the camera scanning will not work if the end-user declines the alert pop-up.

No additional setup is required. The implementation of the SFSafariViewController can be viewed in the `SafariViewController.swift` file.

## Conclusion
Hope this helps, and if you'll have any additional questions, please [reach out](https://microblink.com/contact-us/) to us and we'll be happy to help.
