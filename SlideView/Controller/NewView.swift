//
//  NewView.swift
//  SlideView
//
//  Created by Kuba  on 16/06/2020.
//  Copyright © 2020 Kuba . All rights reserved.
//

import UIKit

protocol BlurVCDelegate: class {
    func removeBlurView()
}

class NewView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var textLabel: UILabel!
    
    weak var delegate: BlurVCDelegate?
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        xShadow()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        xShadow()
    }
    func xShadow() {
        contentView.layer.shadowColor = UIColor.darkGray.cgColor
        contentView.layer.backgroundColor = UIColor.lightGray.cgColor
        contentView.layer.shadowOpacity = 1
        contentView.layer.shadowOffset = .zero
        contentView.layer.shadowRadius = 10
        contentView.layer.cornerRadius = 10
      }
    private func commonInit() {
        Bundle.main.loadNibNamed("NewView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame =  self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    @IBAction func hideButton(_ sender: UIButton) {
        delegate?.removeBlurView()
        contentView.removeFromSuperview()
        
    }
}
