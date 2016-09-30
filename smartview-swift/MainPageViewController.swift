//
//  MainPageViewController.swift
//  smartview-swift
//
//  Created by ND-00316 on 2016/07/13.
//  Copyright © 2016年 shino-g. All rights reserved.
//

import Foundation
import UIKit

protocol MainPageViewDelegate :class {
    func prevPage() -> UIViewController
    func nextPage() -> UIViewController
    func compleatePage()
}

class MainPageViewController : UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
 
    weak var mainPageViewDelegate: MainPageViewDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.delegate   = self
        self.dataSource = self
    }

    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let page = self.mainPageViewDelegate!.prevPage()
        return page
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        let page = self.mainPageViewDelegate!.nextPage()
        return page
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        NSLog( "呼ばれた" )
        if ( completed )
        {
            self.mainPageViewDelegate!.compleatePage()
        }
        else
        {
            return
        }
    }
    
}