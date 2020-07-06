//
//  ViewController.swift
//  SlideView
//
//  Created by Kuba  on 15/06/2020.
//  Copyright © 2020 Kuba . All rights reserved.
//

import UIKit

class ViewController: UIViewController, BlurVCDelegate {
    func removeBlurView() {
       for subview in view.subviews {
            if subview.isKind(of: UIVisualEffectView.self) {
                subview.removeFromSuperview()
            }
        }
    }
    

    
    @IBOutlet var homeView: UIView!
    
    let transition = SlideInTransition()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func showViewButton(_ sender: UIButton) {

       // blurEffect()
        setBlurView()
        let newView = NewView(frame:CGRect(x: 40, y: 450, width: 300, height: 100))
        self.view.addSubview(newView)
        newView.delegate = self

    }

    @IBAction func didTapMenu(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MenuViewController") else { return }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
    
        present(menuViewController, animated: true)
    }

    func setBlurView() {
        let blurView = UIVisualEffectView()
        blurView.frame = view.frame
        blurView.effect = UIBlurEffect(style: .light)
        view.addSubview(blurView)
    }
    
    
    func removeBlurEffect() {
        view.viewWithTag(9)?.removeFromSuperview()
    
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

