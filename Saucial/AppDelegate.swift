//
//  AppDelegate.swift
//  Saucial
//
//  Created by Dunya Kirkali on 05/03/2020.
//  Copyright © 2020 Dunya Kirkali. All rights reserved.
//

import UIKit
import Klendario

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Calendar Authorizations
        Klendario.requestAuthorization { [weak self] (granted, status, error) in
            if let error = error {
                print("error: \(error.localizedDescription)")
            } else {
                print("authorization granted!")
                self?.createCalendarIfDoesntExist()
                
            }
        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

private extension AppDelegate {
    func checkCalendar() -> Bool {
        let calendars = Klendario.getCalendars()
        return calendars.contains(where: { $0.title == "Saucial" })
    }

    func createCalendarIfDoesntExist() {
        if checkCalendar() { return }

        let calendar = Klendario.newCalendar()
        calendar.title = "Saucial"
        calendar.save()
    }
}
