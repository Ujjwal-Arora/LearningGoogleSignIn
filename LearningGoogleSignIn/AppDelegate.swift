//
//  AppDelegate.swift
//  LearningGoogleSignIn
//
//  Created by Ujjwal Arora on 06/12/24.
//

/*
made it for Fb LogIn as
ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation) is not working with .onOpenURL in main App file
 but it is working with .onAppear in view so this is of no use right now for fb logIN
*/
 import SwiftUI
import FBSDKCoreKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Facebook SDK initialization
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        // Handle Facebook login redirects
        return ApplicationDelegate.shared.application(app, open: url, options: options)
    }
}
