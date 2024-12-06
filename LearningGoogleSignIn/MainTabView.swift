//
//  MainTabView.swift
//  LearningGoogleSignIn
//
//  Created by Ujjwal Arora on 06/12/24.
//

import SwiftUI
import GoogleSignIn

struct MainTabView: View {
    var body: some View {
        VStack{
            TabView{
                GoogleSignIn()
                    .tabItem {
                        Label("Google Sign In", systemImage: "swift")
                    }
                    .onOpenURL { url in
                        GIDSignIn.sharedInstance.handle(url)
                    }
                FbSignIn()
                    .tabItem {
                        Label("Fb Sign In", systemImage: "swift")
                    }
                AppleSignIn()
                    .tabItem {
                        Label("Apple Sign In", systemImage: "swift")
                    }
            }
        }
    }
}

#Preview {
    MainTabView()
}
