//
//  AppDelegate.swift
//  Saucial
//
//  Created by Dunya Kirkali on 05/03/2020.
//  Copyright © 2020 Dunya Kirkali. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Calendar Authorizations
        let calendarController = CalendarController()
        calendarController.delegate = self
        calendarController.requestAuthorization()
        
        // Contact Authorizations
        let contactsController = ContactsController()
        contactsController.delegate = self
        contactsController.requestAuthorization()
        
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

extension AppDelegate: CalendarControllerDelegate {
    func userDidAllowAccess(_ controller: CalendarController) {
        controller.createCalendarIfDoesntExist()
    }
    
    func userDidDenyAccess(_ controller: CalendarController, with error: Error) {
        print(error)
    }
}

extension AppDelegate: ContactsControllerDelegate {
    func userDidAllowAccess(_ controller: ContactsController) {
        print("Allow")
    }
    
    func userDidDenyAccess(_ controller: ContactsController) {
        print("Deny")
    }
}
