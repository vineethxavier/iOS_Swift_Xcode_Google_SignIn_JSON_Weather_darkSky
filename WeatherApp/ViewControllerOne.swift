//
//  ViewControllerOne.swift
//  WeatherApp
//
//  Created by Vineeth Xavier on 12/11/17.
//  Copyright © 2017 Vineeth Xavier. All rights reserved.
//


//follow this instruction https://www.simplifiedios.net/google-sign-integration-ios/

//or

//pod googlesignin
//open .xcworkspace
//import googlesignin in VC, signinVc
//goto https://developers.google.com/identity/sign-in/ios/start-integrating
//get config file, add googleservice-info.plist
//copy REVERSED_CLIENT_ID and bundleid to URL types in url schema (click on project>inf0>url
//add deligates to both vc
//add unwind func in both vc
//in VC that has signout, place this unwind and in storyboard drag the button to exit on top and select unwind - to will retuen to main screen after clicking signOUT
//in deligates, add 2 functions
//drag from vc to signinvc and show is as "present modally" and give the segua name

import UIKit
import GoogleSignIn
import Google
var username:String?
class ViewControllerOne: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    @IBAction func exitingUnwind(segue: UIStoryboardSegue) {}  // this circle remains blank
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var error : NSError?
        GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil{
            print(error ?? "google error")
            return
        }
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        let googleSignInButton = GIDSignInButton()
        googleSignInButton.center = view.center
        view.addSubview(googleSignInButton)
    }
    
    //when the signin complets
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil{
            print(error ?? "google error")
            return
        }
        username = user.profile.name
        
        print(user.profile.email)
        print(user.profile.name)
        print(user.profile.imageURL(withDimension: 400))
        print(user.userID)
        print(user.profile.familyName)
        print("serverAuthCode: \(user.serverAuthCode)")
        print(user.hostedDomain)
        performSegue(withIdentifier: "loginSegue", sender: self)
    }
}

