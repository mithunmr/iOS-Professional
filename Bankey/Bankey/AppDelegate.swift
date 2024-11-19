//
//  AppDelegate.swift
//  Bankey
//
//  Created by Mithun M R on 14/11/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let mainViewController = MainViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        if LocalState.isLoggedin{
            if LocalState.hasOnboarded {
                window?.rootViewController = mainViewController
            } else {
                onboardingContainerViewController.delegate = self
                window?.rootViewController = onboardingContainerViewController
            }
        } else {
            loginViewController.loginViewControllerDelegate = self
            window?.rootViewController = loginViewController
        }

        return true
    }
}


extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        LocalState.isLoggedin = true
        window?.rootViewController = onboardingContainerViewController
    }
}

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func onBoardingCompleted() {
        LocalState.hasOnboarded = true
        window?.rootViewController = mainViewController
    }
}
