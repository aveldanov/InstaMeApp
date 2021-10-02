//
//  MainTabController.swift
//  InstaMeApp
//
//  Created by Anton Veldanov on 10/1/21.
//

import UIKit


class MainTabController: UITabBarController{
    
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    
     //MARK: Helpers
    
    
    func configureViewControllers(){
        
        view.backgroundColor = .white

        let feed = FeedController()
        
        let search = SearchController()
        
        let imageSelector = ImageSelectorController()
        
        let notifications = NotificationsController()
        
        let profile = ProfileController()
        
        
        viewControllers = [feed, search, imageSelector, notifications, profile]
        
    }
    
    
    
}
