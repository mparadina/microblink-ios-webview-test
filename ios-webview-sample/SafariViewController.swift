//
//  SafariViewController.swift
//  ios-webview-sample
//
//  Created by Milan Parađina on 17.12.2024..
//

import SwiftUI
import SafariServices

struct SafariViewController: UIViewControllerRepresentable {
    let url: URL

    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemBlue
        return safariVC
    }

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}
