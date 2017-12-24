//
//  AppDelegate.swift
//  Todoey
//
//  Created by André Grillo on 19/12/17.
//  Copyright © 2017 André Grillo. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        //Mostra o path do sandbox
//        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last! as String)
        
        //Location of Realm file
//        print(Realm.Configuration.defaultConfiguration.fileURL!)
        
        
        do {
            _ = try Realm()
        } catch {
            print("Error initialising Realm: \(error)")
        }
        
        
        return true
    }

}

