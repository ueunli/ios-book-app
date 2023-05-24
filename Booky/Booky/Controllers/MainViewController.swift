//
//  ViewController.swift
//  Booky
//
//  Created by J.E on 2023/05/17.
//

import UIKit

final class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewControllers()
    }

    private func setUpViewControllers() {
        viewControllers = [
            navigationController(for: DashboardViewController(),
                                 title: "홈",
                                 image: UIImage.homeIcon),
            navigationController(for: FavoritesViewController(),
                                 title: "즐겨찾기",
                                 image: UIImage.starIcon)
        ]
    }
    
    private func navigationController(for rootViewController: UIViewController,
                                      title: String,
                                      image: UIImage?) -> UINavigationController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = image
        return navController
    }

}

