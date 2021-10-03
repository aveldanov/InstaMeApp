//
//  MainTabController.swift
//  InstaMeApp
//
//  Created by Anton Veldanov on 10/1/21.
//

import UIKit


class MainTabController: UITabBarController{
    let imageView = UIImageView()
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        view.backgroundColor = .red
        configureViewControllers()
    }
    
     //MARK: Helpers
    
    
    func configureViewControllers(){
        
        view.backgroundColor = .white

        let feed = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage:#imageLiteral(resourceName: "home_selected"), rootViewController: FeedController())
        
        let search = SearchController()
        
        let imageSelector = ImageSelectorController()
        
        let notifications = NotificationsController()
        
        let profile = ProfileController()
        
        
        viewControllers = [feed, search, imageSelector, notifications, profile]
        
    }
    
    // helper
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController{
        
        let nav = UINavigationController(rootViewController: rootViewController)
        
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
    }
    
    
    
}
