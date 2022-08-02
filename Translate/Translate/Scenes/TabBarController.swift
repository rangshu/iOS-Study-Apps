//
//  ViewController.swift
//  Translate
//
//  Created by SooRin Kim on 2022/04/27.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let translateViewController = TranslateViewController()
        translateViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Translate", comment: "번역"),
            image: UIImage(systemName: "mic"),
            selectedImage: UIImage(systemName: "mic.fill")
        )
        
        let bookmarkViewController = UINavigationController(rootViewController: BookmarkListViewController())
        bookmarkViewController.tabBarItem = UITabBarItem(
            title: NSLocalizedString("Bookmark", comment: "즐겨찾기"),
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "star.fill")
        )
        
       viewControllers = [translateViewController, bookmarkViewController ]
    }
}

class TabBar: UITabBar {
    private var cachedSafeAreaInsets = UIEdgeInsets.zero

    let keyWindow = UIApplication.shared.connectedScenes
        .filter { $0.activationState == .foregroundActive }
        .compactMap { $0 as? UIWindowScene }
        .first?.windows
        .filter { $0.isKeyWindow }
        .first
    
    override var safeAreaInsets: UIEdgeInsets {
        if let insets = keyWindow?.safeAreaInsets {
            if insets.bottom < bounds.height {
                cachedSafeAreaInsets = insets
            }
        }
        return cachedSafeAreaInsets
    }
}
