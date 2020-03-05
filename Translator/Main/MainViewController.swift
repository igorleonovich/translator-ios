//
//  MainViewController.swift
//  Translator
//
//  Created by Igor Leonovich on 3/1/20.
//  Copyright © 2020 IELIS. All rights reserved.
//

import UIKit
import MessageUI

class MainViewController: BaseViewController {
    
    @IBOutlet weak var offlineButton: CustomButton!
    @IBOutlet weak var cameraButtonSubView: CustomButtonSubView!
    @IBOutlet weak var cameraButton: CustomButton!
    @IBOutlet weak var audioLineView: UIView!
    @IBOutlet weak var microphoneButton: CustomButton!
    @IBOutlet weak var microphoneButtonSubView: CustomButtonSubView!
    @IBOutlet weak var settingsButton: CustomButton!
    @IBOutlet weak var upLanguageImageView: UIImageView!
    @IBOutlet weak var upLanguageImageSubView: LanguageImageSubView!
    @IBOutlet weak var downLanguageImageView: UIImageView!
    @IBOutlet weak var downLanguageImageSubView: LanguageImageSubView!
    
    
    @IBOutlet weak var downTextView: UITextViewFixed!
    @IBOutlet weak var downTextViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var downStackView: UIStackView!
    @IBOutlet weak var downLabel: UILabel!
    @IBOutlet weak var downLabelSubView: UIView!
    
    var mailVC: MFMailComposeViewController?
    
    let core: Core
    
    init(core: Core) {
        self.core = core
        super.init(isModal: false)
        considerBottomSafeArea = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.cornerRadius = 20
        downLabelSubView.layer.cornerRadius = 16
        
        initialBottomIndent = 20.0
        
        setupOfflineMode()
        setupColors()
        setupLanguagesUI()
        updateUpLanguage()
        updateDownLanguage()
        setupTextView()
        setupTapGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Setup
    
    private func setupOfflineMode() {
        updateRegardingToOfflineMode()
        NotificationCenter.default.addObserver(self, selector: #selector(updateRegardingToOfflineMode), name: .didChangedOfflineMode, object: nil)
    }
    
    private func setupColors() {
        updateColors()
        NotificationCenter.default.addObserver(self, selector: #selector(updateColors), name: .didChangedColorMode, object: nil)
    }
    
    private func setupLanguagesUI() {
        [upLanguageImageView, downLanguageImageView].forEach { languageImageView in
            languageImageView?.round()
            languageImageView?.layer.borderWidth = 0.5
            languageImageView?.layer.borderColor = UIColor.Black.Black025Alpha.cgColor
        }
        let upTap = UITapGestureRecognizer(target: self, action: #selector(selectUpLanguage))
        upLanguageImageView?.addGestureRecognizer(upTap)
        upLanguageImageView?.isUserInteractionEnabled = true
        
        let downTap = UITapGestureRecognizer(target: self, action: #selector(selectDownLanguage))
        downLanguageImageView?.addGestureRecognizer(downTap)
        downLanguageImageView?.isUserInteractionEnabled = true
    }
    
    func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func didTap() {
        downTextView.resignFirstResponder()
        print("didTap")
    }
    
    // MARK: - Internal Actions
    
    @objc func updateRegardingToOfflineMode() {
        [cameraButton, cameraButtonSubView, microphoneButton, microphoneButtonSubView].forEach { $0.isHidden = Settings.offlineMode }
        updateColors()
    }
    
    @objc func updateColors() {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let `self` = self else { return }
            self.view.backgroundColor = Settings.offlineMode ? UIColor.Blue.DeepSkyBlue : Settings.basicColor
            [self.offlineButton, self.cameraButton, self.settingsButton].forEach { $0.update() }
            self.audioLineView.backgroundColor = Settings.colorMode == .light ? UIColor.Blue.DeepSkyBlue : UIColor.Blue.LilyWhiteSemiTransparent
            [self.upLanguageImageSubView, self.downLanguageImageSubView].forEach { languageImageSubView in
                languageImageSubView?.backgroundColor = Settings.colorMode == .light ? UIColor.Blue.LilyWhite : .white
            }
            self.downLabelSubView.backgroundColor = Settings.colorMode == .light ? UIColor.Blue.DeepSkyBlue : UIColor.Black.Gunmetal
        }
    }
    
    private func updateUpLanguage() {
        if let flag = Settings.upLanguage.flag {
            self.upLanguageImageView.image = UIImage(named: flag)
        } else {
            self.upLanguageImageView.image = nil
        }
    }
    
    private func updateDownLanguage() {
        if let flag = Settings.downLanguage.flag {
            self.downLanguageImageView.image = UIImage(named: flag)
        } else {
            self.downLanguageImageView.image = nil
        }
    }
    
    // MARK: - User Actions
    
    @objc func selectUpLanguage() {
        let vc = LanguageSelectViewController(core: core, selectedLanguage: Settings.upLanguage, completion: { language in
            Settings.upLanguage = language
            self.updateUpLanguage()
        })
        present(vc, animated: true)
    }
    
    @objc func selectDownLanguage() {
        let vc = LanguageSelectViewController(core: core, selectedLanguage: Settings.downLanguage, completion: { language in
            Settings.downLanguage = language
            self.updateDownLanguage()
        })
        present(vc, animated: true)
    }
    
    @IBAction func pressOfflineButton(_ sender: Any) {
        Settings.offlineMode = !Settings.offlineMode
        
        let value = Settings.offlineMode ? "On" : "Off"
        let alert = UIAlertController(title: nil, message: "Offline Mode \(value)", preferredStyle: .alert)
        alert.view.layer.cornerRadius = 15
        
        present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            alert.dismiss(animated: true)
        }
        
        NotificationCenter.default.post(name: .didChangedOfflineMode, object: nil)
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
    
    // MARK: - Keyboard
    
    override func keyboardWillShow(_ notification: Notification) {
        super.keyboardWillShow(notification)
        UIView.animate(withDuration: 0.5) {
            [self.microphoneButton, self.microphoneButtonSubView, self.audioLineView].forEach { $0.isHidden = true }
        }
    }
    
    override func keyboardWillHide(_ notification: Notification) {
        super.keyboardWillHide(notification)
        UIView.animate(withDuration: 0.5) {
            [self.microphoneButton, self.microphoneButtonSubView, self.audioLineView].forEach { $0.isHidden = false }
        }
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

extension MainViewController: UITextViewDelegate {
    
    func setupTextView() {
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        adjustUITextViewHeight()
        downLabel.text = textView.text
    }
    
    func adjustUITextViewHeight()
    {
//        downTextView.translatesAutoresizingMaskIntoConstraints = true
//        downTextView.sizeToFit()
//        textView.scrollEnabled = false
        
        // Assuming there is width constraint setup on the textView.
        let targetSize = CGSize(width: downTextView.frame.width, height: CGFloat(MAXFLOAT))
        downTextViewHeightConstraint.constant = downTextView.sizeThatFits(targetSize).height
    }
}

@IBDesignable class UITextViewFixed: UITextView {
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    func setup() {
        textContainerInset = UIEdgeInsets.zero
        textContainer.lineFragmentPadding = 0
    }
}
