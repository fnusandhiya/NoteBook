//
//  AppDelegate.swift
//  NoteBook
//
//  Created by SandhyAvinash on 4/15/19.
//  Copyright © 2019 fnu sandhiya. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
      
        
        do {
            _ = try Realm()
       
        } catch {
            print("error initializing new realm , \(error)")
        }
        
        return true
    }
    
    
}




