//
//  AppDelegate.swift
//  Bankey
//
//  Created by tullah nazari on 12/26/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let loginViewCOntroller = LoginViewController()
    
    var onboardingViewController = OnboardingContainerViewController()
    
    let dummyViewController = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewCOntroller.delegate = self
        onboardingViewController.delegate = self
        dummyViewController.logoutDelegate = self
        
        window?.rootViewController = loginViewCOntroller
//        window?.rootViewController = OnboardingContainerViewController()
//        window?.rootViewController = OnboardingViewController(heroImageName: "delorean", titleText: "Banksy is faster, easier to use, and has a brand new look and feel that will make you feel like you are back in 1989.")
        
        return true
    }
    
    
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 1, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        if LocalState.hasOnboarded {
            setRootViewController(dummyViewController)
        } else {
            setRootViewController(onboardingViewController)
        }
    }
    

    
    
}

extension AppDelegate: onboardingContainerViewControllerDelegate {
    func didOnboard() {
        LocalState.hasOnboarded = true
        setRootViewController(dummyViewController)
    }
    
}

extension AppDelegate: LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewCOntroller)
    }
}
