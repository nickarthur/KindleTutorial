//
//  AppDelegate.swift
//  Kindle Tutorial
//
//  Created by Dawid Ramone on 20/02/2018.
//  Copyright © 2018 Dawid Czmyr. All rights reserved.
//

import UIKit

class LightStatusBarController: UINavigationController { // robię własną klasę z nadpisanym preferowanym sytylem sttus bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds) // tworzę okno samemu zamiast storyboard
        window?.makeKeyAndVisible() // chcę żeby okno było widoczne
        
        window?.rootViewController = LightStatusBarController(rootViewController: ViewController()) // umieszczam navigationController  // aplikacja musi posiadać rootviewController
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
   
    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

