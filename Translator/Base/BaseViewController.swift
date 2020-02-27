//
//  BaseViewController.swift
//  Translator
//
//  Created by Igor Leonovich on 2/27/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func modalSetup() {
        if modalPresentationStyle == .pageSheet {
            modalPresentationStyle = .overCurrentContext
        }
        
        if #available(iOS 13.0, *) {
            isModalInPresentation = true
        }
    }
}
