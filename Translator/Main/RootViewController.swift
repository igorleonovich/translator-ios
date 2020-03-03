//
//  RootViewController.swift
//  Translator
//
//  Created by Igor Leonovich on 3/1/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit

class RootViewController: BaseViewController {
    
    let centerView = UIView()
    
    let core: Core
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    init(core: Core) {
        self.core = core
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        centerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerView)
        centerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        centerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        centerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        let mainVC = MainViewController(core: core)
        addChild(mainVC)
        
        mainVC.view.translatesAutoresizingMaskIntoConstraints = false
        centerView.addSubview(mainVC.view)
        
        mainVC.view.topAnchor.constraint(equalTo: centerView.topAnchor).isActive = true
        mainVC.view.leadingAnchor.constraint(equalTo: centerView.leadingAnchor).isActive = true
        mainVC.view.trailingAnchor.constraint(equalTo: centerView.trailingAnchor).isActive = true
        mainVC.view.bottomAnchor.constraint(equalTo: centerView.bottomAnchor).isActive = true
        
        mainVC.didMove(toParent: self)
    }
}
