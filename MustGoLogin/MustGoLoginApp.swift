//
//  MustGoLoginApp.swift
//  MustGoLogin
//
//  Created by 이성주 on 2022/07/05.
//

import SwiftUI
import Firebase
import KakaoSDKCommon
import KakaoSDKAuth


@main
struct MustGoLoginApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            let viewModel = AppViewModel()
            ContentView()
                .environmentObject(viewModel)
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    
    
        
        func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
               if (AuthApi.isKakaoTalkLoginUrl(url)) {
                   return AuthController.handleOpenUrl(url: url, options: options)
               }
               
               return false
           }
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        KakaoSDK.initSDK(appKey: "c9d615cffc2ce8b7e97b6b9fc449377a", loggingEnable:false)
        return true
    }
}
