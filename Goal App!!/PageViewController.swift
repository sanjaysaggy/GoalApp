//
//  PageViewController.swift
//  Success! App
//
//  Created by mac on 19/08/17.
//  Copyright © 2017 ios. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController,UIPageViewControllerDataSource,UIPageViewControllerDelegate {

    
    var pageControl = UIPageControl()
    
    
    lazy var orderedViewControllers: [UIViewController] = {
        return [self.newVC(viewController: "FirstDescriptionView"),
                self.newVC(viewController: "SecondDescriptionView"),
                self.newVC(viewController: "ThirdDescriptionView")
        
        ]
    }()
  
    
 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.dataSource = self
        self.delegate = self
 
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],direction: .forward,animated: true,completion: nil)
        }
        
        
       configurePageControl()
    
    }
 
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 40,width: UIScreen.main.bounds.width,height: 5))
        self.pageControl.numberOfPages = orderedViewControllers.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.black
        self.pageControl.pageIndicatorTintColor = UIColor.white
        self.pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
 
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContentViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.index(of: pageContentViewController)!
    }
    
    
    
    
    
    func newVC (viewController: String?) -> UIViewController {
    
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController!)
    
    }
    
    
//    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
//        <#code#>
//    }
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        // User is on the first view controller and swiped left to loop to
        // the last view controller.
        guard previousIndex >= 0 else {
//            return orderedViewControllers.last
//            // Uncommment the line below, remove the line above if you don't want the page control to loop.
             return nil
        }
        
//        guard orderedViewControllers.count > previousIndex else {
//            return nil
//        }
        
        return orderedViewControllers[previousIndex]
    }
    
    
    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        // User is on the last view controller and swiped right to loop to
        // the first view controller.
        
            // Uncommment the line below, remove the line above if you don't want the page control to loop.
            // return nil
        
       
        //guard orderedViewControllersCount != nextIndex else {
           //  return orderedViewControllers.first
         //}
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    
}
