//
//  HomeVC.swift
//  MusicApp
//
//  Created by Семен Гайдамакин on 17.08.2022.
//  Папка табБара, откуда переходим по всем нашим вьюхам


import Foundation
import UIKit

class MainTabBarVC : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        setTabBarAppearance()
    }
    
    private func generateTabBar() {
        viewControllers = [
        generateVC(
                    viewController: HomeVC(),
                   title: "Home",
                   image: UIImage(systemName: "house.fill")),
        generateVC(
                    viewController: SearchVC(),
                   title: "Search",
                   image: UIImage(systemName: "magnifyingglass")),
        generateVC(
                    viewController: MyMusicVC(),
                   title: "My Music",
                   image: UIImage(systemName: "music.note.house")),
        generateVC(
                    viewController: NowPlayingVC(),
                    title: "Playing",
                    image: UIImage(systemName: "music.note"))
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        let positionOnX : CGFloat = 2
        let positionOnY : CGFloat = 15
        let width = tabBar.bounds.width - positionOnX
        let height = tabBar.bounds.height + positionOnY*2
        
        let roundedLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(roundedRect:
                                        CGRect(
                                            x: positionOnX,
                                            y: tabBar.bounds.minY - positionOnY,
                                            width: width,
                                            height: height),
                                      cornerRadius: height/2)
        roundedLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundedLayer, at: 0)
        
        tabBar.itemWidth = width/4
        tabBar.itemPositioning = .centered
        
        roundedLayer.fillColor = UIColor.mainWhite.cgColor
        tabBar.tintColor = UIColor.tabBarItemAccent
        tabBar.unselectedItemTintColor = .tabBarItemLight
    }
}
