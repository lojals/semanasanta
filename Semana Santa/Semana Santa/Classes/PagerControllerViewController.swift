//
//  PagerControllerViewController.swift
//  Semana Santa
//
//  Created by Jorge Raul Ovalle Zuleta on 3/9/15.
//  Copyright (c) 2015 Jorge Ovalle. All rights reserved.
//

import UIKit

class PagerControllerViewController: GenericViewController, UIPageViewControllerDataSource {

    var array:NSMutableArray!
    var pageViewController:UIPageViewController!
    var btnBack:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.patternColor()
        
        /*array = NSMutableArray()
        array.addObject("1")
        array.addObject("1")
        array.addObject("1")
        array.addObject("1")
        array.addObject("1")
        array.addObject("1")
        array.addObject("1")*/
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as UIPageViewController
        self.pageViewController.dataSource = self
        
        var startingViewController = self.viewControllerAtIndex(0)
        var viewControllers = NSMutableArray()
        viewControllers.addObject(startingViewController!)
        
        self.pageViewController.setViewControllers(viewControllers, direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 55)
        
        self.addChildViewController(pageViewController)
        self.view.addSubview(pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        var timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self, selector: Selector("someSelector"), userInfo: nil, repeats: false)
        
        let grad1 = Gradient(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 64), type: "Top")
        self.view.addSubview(grad1)
        
        btnBack = UIButton(frame: CGRect(x: 0, y: 20, width: 45, height: 45))
        btnBack.titleLabel?.font = UIFont.iconFontWithSize(26)
        btnBack.setTitleColor(UIColor.theme1(), forState: UIControlState.Normal)
        btnBack.setTitle(NSString.iconStringForEnum(FlatUIIcon.FUIArrowLeft), forState: UIControlState.Normal)
        self.view.addSubview(btnBack)
    }

    
    func someSelector() {
        self.interstitial.presentFromRootViewController(self)
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
        pageContentViewController.array = array
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
        return array.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }

    
}
