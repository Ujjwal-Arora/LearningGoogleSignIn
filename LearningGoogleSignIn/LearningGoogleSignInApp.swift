//
//  LearningGoogleSignInApp.swift
//  LearningGoogleSignIn
//
//  Created by Ujjwal Arora on 05/12/24.
//

import SwiftUI
import GoogleSignIn
import FBSDKCoreKit

@main
struct LearningLogInApp: App {
    // Attach the AppDelegate
 //   @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
}

//
//@main
//struct LearningGoogleSignInApp: App {
//    var body: some Scene {
//        WindowGroup {
////            GoogleSignIn()
////                .onOpenURL { url in
////                    GIDSignIn.sharedInstance.handle(url)
////                }
//            
//            FbSignIn()
//                .onOpenURL { url in
//                    ApplicationDelegate.shared.application(UIApplication.shared, open: url, sourceApplication: nil, annotation: UIApplication.OpenURLOptionsKey.annotation)
//                }
//
//            
//        }
//    }
//}
