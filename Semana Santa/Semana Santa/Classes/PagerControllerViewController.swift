//
//  PagerControllerViewController.swift
//  Semana Santa
//
//  Created by Jorge Raul Ovalle Zuleta on 3/9/15.
//  Copyright (c) 2015 Jorge Ovalle. All rights reserved.
//

import UIKit

class PagerControllerViewController: UIViewController, UIPageViewControllerDataSource {

    var array:NSMutableArray!
    var pageViewController:UIPageViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        array = NSMutableArray()
        array.addObject("1")
        array.addObject("1")
        array.addObject("1")
        array.addObject("1")
        
        // Create page view controller
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as UIPageViewController
        self.pageViewController.dataSource = self
        
        //    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
        
        var startingViewController = self.viewControllerAtIndex(0)
        var viewControllers = NSMutableArray()
        viewControllers.addObject(startingViewController!)
        
        self.pageViewController.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
        
        // Change the size of page view controller
        
        
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 10);
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
        
        //self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func viewControllerAtIndex(index:Int) -> ViaCrusisVC?{
        if array.count == 0 || index >= array.count{
            return nil
        }
        var pageContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageContentViewController") as ViaCrusisVC
        pageContentViewController.pageIndex = index
        return pageContentViewController
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as ViaCrusisVC).pageIndex
        if (index == NSNotFound) {
            return nil
        }
        index = index + 1
        if index == self.array.count{
            return nil
        }
        
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        var index = (viewController as ViaCrusisVC).pageIndex
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        index = index - 1
        
        return self.viewControllerAtIndex(index)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 12
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

}
