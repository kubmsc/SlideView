//
//  ViewController.swift
//  SlideView
//
//  Created by Kuba  on 15/06/2020.
//  Copyright © 2020 Kuba . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    let transition = SlideInTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showViewButton(_ sender: UIButton) {

        let newView = NewView(frame:CGRect(x: 40, y: 450, width: 300, height: 100))
        self.view.addSubview(newView)
        
    }

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuViewController") else { return }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
    
        present(menuViewController, animated: true)
    }
    
    
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresnting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresnting = false 
        return transition
    }
    
}

