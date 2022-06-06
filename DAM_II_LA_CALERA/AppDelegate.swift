//
//  AppDelegate.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 4/11/21.
//

import UIKit
import Firebase
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        
    }
    
    lazy var persistanceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataUser")
        container.loadPersistentStores(completionHandler: {(storeDescription, error) in
            if let error = error as NSError?{
                print("Error en Persistance Container")
            }
        })
        return container
    }()
}

