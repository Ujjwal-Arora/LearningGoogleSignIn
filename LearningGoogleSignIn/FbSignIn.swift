//
//  ContentView.swift
//  FacebookLogInSwiftUI
//
//  Created by Ujjwal Arora on 06/12/24.
//

import FBSDKLoginKit
import SwiftUI

struct FbSignIn : View {
    @State var manager = LoginManager()
    @State var email = ""
    @State var name = ""
    @State var picture = ""

    @State var loggedIn = false
    var body: some View {
        VStack{
            Text(email)
            Text(name)
            AsyncImage(url: URL(string: picture), scale: 1)
                .frame(width: 100, height: 100)

            if loggedIn{
                Button("Log Out") {
                    manager.logOut()
                    email = ""
                    loggedIn = false
                }
            }else{
                Button("Fb LogIn Button") {
                    manager.logIn(permissions: ["public_profile", "email"], from: nil) { result, error in
                        if let error {
                            print("Error: \(error.localizedDescription)")
                            return
                        }
                        if !result!.isCancelled{
                            loggedIn = true
                            
                            let request = GraphRequest(graphPath: "me", parameters: [
                                "fields": "id,name,email,gender,birthday,location,picture,friends,hometown"
                            ])
                            request.start { _, response, _ in
                                guard let profileData = response as? [String: Any] else { return }
                                email = profileData["email"] as! String
                                name = profileData["name"] as! String
                                if let pictureData = profileData["picture"] as? [String: Any],
                                       let data = pictureData["data"] as? [String: Any],
                                       let pictureUrl = data["url"] as? String {
                                        print("Profile Picture URL: \(pictureUrl)")
                                    picture = pictureUrl
                                    }//                                picture = print(profileData["picture"]) as! String

                                profileData.keys.forEach { print($0) }
                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            ApplicationDelegate.shared.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
        }
    }
}


#Preview {
    FbSignIn()
}
