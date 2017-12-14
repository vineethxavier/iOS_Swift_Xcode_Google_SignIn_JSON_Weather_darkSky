//
//  WeatherVC.swift
//  WeatherApp
//
//  Created by Vineeth Xavier on 12/13/17.
//  Copyright © 2017 Vineeth Xavier. All rights reserved.
//

import UIKit
import SwiftyJSON
import GoogleSignIn
import Google

class WeatherVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   // @IBAction func exitingUnwind(segue: UIStoryboardSegue) {} // this circle remains blank
    @IBAction func SignOut(_ sender: UIButton) {
        GIDSignIn.sharedInstance().signOut()
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var tabelViewWeather: UITableView!
    
        override func viewDidLoad() {
            super.viewDidLoad()
            tabelViewWeather.delegate = self
            tabelViewWeather.dataSource = self
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 9
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tabelViewWeather.dequeueReusableCell(withIdentifier: "cellWeather", for: indexPath)
            
            cell.textLabel?.text = "\(structObj!.summary)"
            cell.detailTextLabel?.text = "\(structObj!.temperature)"
            
            return cell
        }
        
        
        
        
}

