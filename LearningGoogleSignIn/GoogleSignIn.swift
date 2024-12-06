//
//  ContentView.swift
//  LearningGoogleSignIn
//
//  Created by Ujjwal Arora on 05/12/24.
//


import SwiftUI
//114298827803-cvu4oi63r5hi9e4ib749ohhfa2pdt0r7.apps.googleusercontent.com
import GoogleSignIn

struct GoogleSignIn: View {
    @State var userName = ""
    @State var email = ""
    @State var imageUrl = ""
    
    var body: some View {
        VStack {
            Button {
                print("Sign out clicked")
                GIDSignIn.sharedInstance.signOut()
                
                //put user to nil
                userName = ""
                email = ""
                imageUrl = ""
                
            } label: {
                Text("Sign Out")
            }

            Text(userName)
            Text(email)
            AsyncImage(url: URL(string: imageUrl),scale: 1)
                .frame(width: 100, height: 100)
            Button("LogIn with Google") {
                Task{
                    do{
                        try await handleSignUpButton()
                    }catch{
                        print(error.localizedDescription)
                    }
                }
            }
        }
        .padding()
        .task {
            do{
                let result = try await  GIDSignIn.sharedInstance.restorePreviousSignIn()
                userName = result.profile?.name ?? "no name"
                email = result.profile?.email ?? "no email"
                imageUrl = result.profile?.imageURL(withDimension: 200)?.absoluteString ?? "no imageUrl"
                
            }catch{
                print(error.localizedDescription)
            }
        }
    }
    func handleSignUpButton() async throws {
        print("Sign In with google clicked")
        if let rootViewController = getRootViewController(){
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            userName = result.user.profile?.name ?? "no name"
            email = result.user.profile?.email ?? "no email"
            imageUrl = result.user.profile?.imageURL(withDimension: 200)?.absoluteString ?? "no imageUrl"
        }
    }
}
func getRootViewController() -> UIViewController? {
    guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let rootViewController = scene.windows.first?.rootViewController else {
        return nil
    }
    return getVisibleViewController(from: rootViewController)
}

private func getVisibleViewController(from vc: UIViewController) -> UIViewController {
    if let nav = vc as? UINavigationController {
        return getVisibleViewController(from: nav.visibleViewController ?? nav)
    }
    if let tab = vc as? UITabBarController {
        return getVisibleViewController(from: tab.selectedViewController ?? tab)
    }
    if let presented = vc.presentedViewController {
        return getVisibleViewController(from: presented)
    }
    return vc
}

#Preview {
    GoogleSignIn()
}
