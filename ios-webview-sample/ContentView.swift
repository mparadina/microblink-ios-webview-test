//
//  ContentView.swift
//  ios-webview-sample
//
//  Created by Milan Parađina on 13.12.2024..
//

import SwiftUI

struct ContentView: View {
    private var urlString: String = "https://blinkid-test.netlify.app/"
    
    var body: some View {
        VStack {
            Text(urlString)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .background(Color.black)
            WebView(url: URL(string:urlString)!)
        }
        .background(Color.black)
    }
}
#Preview {
    ContentView()
}

