//
//  MainViewController.swift
//  Translator
//
//  Created by Igor Leonovich on 3/1/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit
import FlagKit
import MessageUI

class MainViewController: UIViewController {
    
    @IBOutlet weak var offlineButton: CustomButton!
    @IBOutlet weak var cameraButton: CustomButton!
    @IBOutlet weak var microphoneButton: CustomButton!
    @IBOutlet weak var settingsButton: CustomButton!
    @IBOutlet weak var upLanguageImageView: UIImageView!
    @IBOutlet weak var downLanguageImageView: UIImageView!
    
    @IBOutlet weak var audioLineView: UIView!
    
    var mailVC: MFMailComposeViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 20
        updateColors()
        NotificationCenter.default.addObserver(self, selector: #selector(updateColors), name: .didChangedColorMode, object: nil)
    }
    
    @objc func updateColors() {
        view.backgroundColor = Settings.basicColor
        [offlineButton, cameraButton, settingsButton].forEach { $0.update() }
        audioLineView.backgroundColor = Settings.colorMode == .light ? UIColor.Blue.DeepSkyBlue : UIColor.Blue.LilyWhiteSemiTransparent
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
