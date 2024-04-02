//
//  LoopSpeakApp.swift
//  LoopSpeak
//
//  Created by Pieter Yoshua Natanael on 29/11/23.
//

//import SwiftUI
//import AVFoundation
//import UIKit

import SwiftUI

@main
struct YourAppName: App {
    // Register the AppDelegate for UIKit lifecycle events.
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


/*
@main
struct LoopSpeakApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
 
 

@main
struct LoopSpeakApp: App {
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
*/
