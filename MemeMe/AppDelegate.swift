//
//  AppDelegate.swift
//  MemeMe
//
//  Created by Mohammed Almalki on 13/04/2019.
//  Copyright © 2019 Mohowsa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var memes = [Meme]()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
}

