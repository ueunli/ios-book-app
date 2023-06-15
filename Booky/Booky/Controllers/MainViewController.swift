//
//  ViewController.swift
//  Booky
//
//  Created by J.E on 2023/05/17.
//

import UIKit

final class MainViewController: UITabBarController {
    
    //MARK: - Property
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .White.medium1
        view.layer.zPosition = -1
        return view
    }()
    
    private let accentLayer: CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.Purple.accent.cgColor
        return layer
    }()

    //MARK: - Overridden Method
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViewControllers()
        configureViewHierarchy()
        configureTabBarDesign()
        configureTabBarItemDesign()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureTabBarLocation()
        configureBackgroundDesign()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let point = item.tag == 0 ? view.frame.minX : view.frame.midX
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options: [.layoutSubviews]) {
            self.accentLayer.transform = CATransform3DMakeTranslation(point, 0, 0)
        }
    }
    
    //MARK: - Private Method
    
    private func setUpViewControllers() {
        viewControllers = [
            navigationController(for: DashboardViewController(),
                                 title: "홈",
                                 image: .homeIcon),
            navigationController(for: FavoritesViewController(),
                                 title: "즐겨찾기",
                                 image: .favoriteIcon)
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
    
    private func configureViewHierarchy() {
        view.addSubview(backgroundView)
        tabBar.insertSubview(backgroundView, at: 0)
        backgroundView.layer.addSublayer(accentLayer)
    }
    
    private func configureTabBarLocation() {
        tabBar.frame.size.height = 60
        tabBar.frame.origin.y = view.frame.maxY - 60
    }
    
    private func configureBackgroundDesign() {
        backgroundView.frame = .init(x: self.view.frame.minX,
                                     y: self.tabBar.bounds.minY - 30,
                                     width: self.view.frame.width,
                                     height: 60)
        accentLayer.frame = .init(x: self.view.frame.minX,
                                  y: self.view.frame.minY,
                                  width: self.view.frame.width * 0.5,
                                  height: 60)
    }
    
    private func configureTabBarDesign() {
        tabBar.tintColor = .White.pure
        tabBar.unselectedItemTintColor = .Black.medium
        tabBar.isTranslucent = true
        tabBar.backgroundColor = UIColor.white
        tabBar.backgroundImage = UIImage()
        tabBar.shadowImage = UIImage()
        tabBar.layer.shadowColor = UIColor.clear.cgColor
    }
    
    private func configureTabBarItemDesign() {
        tabBar.items?.enumerated().forEach {
            $0.1.tag = $0.0
            $0.1.titlePositionAdjustment.vertical = -4
            $0.1.setTitleTextAttributes([.font: UIFont.systemFont(ofSize: 12)], for: .normal)
        }
    }

}
