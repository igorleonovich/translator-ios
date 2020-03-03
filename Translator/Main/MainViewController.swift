//
//  MainViewController.swift
//  Translator
//
//  Created by Igor Leonovich on 3/1/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit
import MessageUI

class MainViewController: UIViewController {
    
    @IBOutlet weak var offlineButton: CustomButton!
    @IBOutlet weak var cameraButton: CustomButton!
    @IBOutlet weak var microphoneButton: CustomButton!
    @IBOutlet weak var settingsButton: CustomButton!
    @IBOutlet weak var upLanguageImageView: UIImageView!
    @IBOutlet weak var downLanguageImageView: UIImageView!
    @IBOutlet weak var upLanguageImageSubView: LanguageImageSubView!
    @IBOutlet weak var downLanguageImageSubView: LanguageImageSubView!
    
    @IBOutlet weak var audioLineView: UIView!
    
    var mailVC: MFMailComposeViewController?
    
    let core: Core
    
    init(core: Core) {
        self.core = core
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 20
        updateColors()
        NotificationCenter.default.addObserver(self, selector: #selector(updateColors), name: .didChangedColorMode, object: nil)
        [upLanguageImageView, downLanguageImageView].forEach { languageImageView in
            languageImageView?.round()
            languageImageView?.layer.borderWidth = 0.5
            languageImageView?.layer.borderColor = UIColor.Black.Black025Alpha.cgColor
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(selectLanguage))
            languageImageView?.addGestureRecognizer(tap)
            languageImageView?.isUserInteractionEnabled = true
        }
    }
    
    @objc func selectLanguage() {
        let vc = LanguageSelectViewController(core: core)
        present(vc, animated: true, completion: nil)
    }
    
    @objc func updateColors() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let `self` = self else { return }
            self.view.backgroundColor = Settings.basicColor
            [self.offlineButton, self.cameraButton, self.settingsButton].forEach { $0.update() }
            self.audioLineView.backgroundColor = Settings.colorMode == .light ? UIColor.Blue.DeepSkyBlue : UIColor.Blue.LilyWhiteSemiTransparent
            [self.upLanguageImageSubView, self.downLanguageImageSubView].forEach { languageImageSubView in
                languageImageSubView?.backgroundColor = Settings.colorMode == .light ? UIColor.Blue.LilyWhite : .white
            }
        }
    }
    
    @IBAction func pressOfflineButton(_ sender: Any) {
        
    }
    
    @IBAction func pressCameraButton(_ sender: Any) {
        
    }
    
    @IBAction func pressSettingsButton(_ sender: Any) {
        let optionMenu = UIAlertController(title: nil, message: "Settings", preferredStyle: .actionSheet)
        
        let proposedColorModeString = Settings.proposedColorMode.rawValue.uppercasingFirst
        let colorModeAction = UIAlertAction(title: "Switch to \(proposedColorModeString) Mode", style: .default, handler: { action in
            Settings.colorMode = Settings.proposedColorMode
            NotificationCenter.default.post(name: .didChangedColorMode, object: nil)
        })
        let proposedVoiceModeString = Settings.proposedVoiceMode.rawValue.uppercasingFirst
        let voiceAction = UIAlertAction(title: "Switch voice to \(proposedVoiceModeString)", style: .default, handler: { action in
            Settings.voiceMode = Settings.proposedVoiceMode
        })
        let contactAction = UIAlertAction(title: "Contact Us", style: .default, handler: { action in
            if MFMailComposeViewController.canSendMail() {
                self.mailVC = MFMailComposeViewController()
                guard let mailVC = self.mailVC else { return }
                mailVC.mailComposeDelegate = self
                mailVC.setToRecipients(["support@oursite.com"])
                mailVC.setMessageBody("<p>Hello, world!</p>", isHTML: true)

                self.parent?.present(mailVC, animated: true)
            } else {
                print("error send mail")
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        [colorModeAction, voiceAction, contactAction, cancelAction].forEach { optionMenu.addAction($0) }
        self.parent?.present(optionMenu, animated: true, completion: nil)
    }
}

extension MainViewController: MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        mailVC?.dismiss(animated: true, completion: nil)
        print(result)
        if let error = error {
            print(error)
        }
    }
}
