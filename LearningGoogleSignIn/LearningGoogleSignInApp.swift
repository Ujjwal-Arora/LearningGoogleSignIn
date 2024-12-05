//
//  LearningGoogleSignInApp.swift
//  LearningGoogleSignIn
//
//  Created by Ujjwal Arora on 05/12/24.
//

import SwiftUI
import GoogleSignIn

@main
struct LearningGoogleSignInApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
            
        }
    }
}
