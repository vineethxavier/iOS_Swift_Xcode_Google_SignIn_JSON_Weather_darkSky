//
//  signInSuccessVC.swift
//  WeatherApp
//
//  Created by Vineeth Xavier on 12/12/17.
//  Copyright © 2017 Vineeth Xavier. All rights reserved.
//

import UIKit
import GoogleSignIn
import Google
import SwiftyJSON
struct weatherStruct {
    var latitude:String
    var longitude:String
    var timezone:String
    var summary:String
    var temperature:String
    var humidity:String
    var pressure:String
    var windSpeed:String
    var visibility:String
}

var structObj:weatherStruct?

class signInSuccessVC: UIViewController {
 @IBAction func exitingUnwind(segue: UIStoryboardSegue) {} // this circle remains blank
    @IBOutlet weak var lblUserName: UILabel!
    
    @IBAction func btnSignOut(_ sender: UIButton) {
        
        GIDSignIn.sharedInstance().signOut()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Success from signinVC!!")
        if let usrNme = username{
            lblUserName.text = usrNme
            
        }
    // weather json parsing from darksky
    let urlJSON = "https://api.darksky.net/forecast/6a95c4b8e4fe21d60be3ece048f6a491/37.8267,-122.4233"
        guard let url = URL.init(string: urlJSON) else{
            return
        }
        do{
            let response = try  Data.init(contentsOf: url)
            let json = JSON(data: response)
            let lati = json["latitude"]
            let longi = json["longitude"]
            let tZone = json["longitude"]["timezone"]
            let summary = json["currently"]["summary"]
            let temp = json["currently"]["temperature"]
            let humid = json["currently"]["humidity"]
            let pressure = json["currently"]["pressure"]
            let wind = json["currently"]["windSpeed"]
            let visibility = json["currently"]["visibility"]
             structObj = weatherStruct(latitude: "\(lati)", longitude: "\(longi)", timezone: "\(tZone)", summary: "\(summary)", temperature: "\(temp)", humidity: "\(humid)", pressure: "\(pressure)", windSpeed: "\(wind)", visibility: "\(visibility)")
            
            print("latitude: \(json["latitude"])")
            print("longitude: \(json["longitude"])")
            print("timezone: \(json["longitude"]["timezone"])")
            
            print("Current Summary: \(  json["currently"]["summary"])")
            print("Current Temp: \(  json["currently"]["temperature"])")
            print("Current humidity: \(  json["currently"]["humidity"])")
            print("Current pressure: \(  json["currently"]["pressure"])")
            print("Current windSpeed: \(  json["currently"]["windSpeed"])")
            print("Current visibility: \(  json["currently"]["visibility"])")
            
            print("hourly Temp: \(  json["hourly"]["data"][0]["temperature"])")
            
        }
        catch let error{
            print(error)
        }
    
    }//view did load
    
}//class signinVC
