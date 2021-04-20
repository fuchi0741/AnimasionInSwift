//
//  AuthViewController.swift
//  AnimasionSwift
//
//  Created by 渕一真 on 2021/04/20.
//

import UIKit

final class AuthViewController: UIViewController {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var loginSegmentControllerOutlet: UISegmentedControl!
    @IBOutlet weak private var emailTextField: UITextField!
    @IBOutlet weak private var passwordTextField: UITextField!
    @IBOutlet weak private var continueButton: UIButton!
    
    @IBOutlet weak private var textfieldContainerView: UIView!
    
    private let repeatPasswordTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createRepeatPasswordTextField()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        titleLabel.alpha = 0
        continueButton.isHidden = true
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateTitleLabel()
        showContinueButton()
    }
    
    private enum AuthStatus: Int {
        case login
        case signup
    }
    
    @IBAction private func loginSegmentControllerValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == AuthStatus.signup.rawValue {
            addTextfieldWithTransition()
            moveContinueButtonDown()
        }
        
        if sender.selectedSegmentIndex == AuthStatus.login.rawValue {
            removeTextfieldWithTransition()
            moveContinueButtonUp()
        }
    }
    
    @IBAction private func didTapContinueButton(_ sender: UIButton) {
        animateContinueButtonOnClick()
        self.segueToNextViewController(segueID: Segues.toKeyframeSeg, delay: 0.1)
    }
    
    private func animateTitleLabel() {
        UIView.animate(withDuration: 2.0, delay: 0.25, usingSpringWithDamping: 0.6, initialSpringVelocity: 6, options: []) {
            self.titleLabel.alpha = 1
            self.titleLabel.frame.origin.y += 150
        }
    }
    
    private func showContinueButton() {
        UIView.transition(with: self.continueButton, duration: 2.0, options: [.transitionCrossDissolve]) {
            self.continueButton.isHidden = false
        }
    }
    
    private func addTextfieldWithTransition() {
        UIView.transition(with: self.textfieldContainerView, duration: 1.0, options: [.transitionCrossDissolve]) {
            self.textfieldContainerView.addSubview(self.repeatPasswordTextField)
        }
    }
    
    private func removeTextfieldWithTransition() {
        UIView.transition(with: self.textfieldContainerView, duration: 0.5, options: [.transitionCrossDissolve]) {
            self.repeatPasswordTextField.removeFromSuperview()
        }
    }

    
    private func moveContinueButtonDown() {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseInOut]) {
            self.continueButton.center.y += 25
        }
    }
    
    private func moveContinueButtonUp() {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseInOut]) {
            self.continueButton.center.y -= 25
        }
    }
    
    private func animateContinueButtonOnClick() {
        continueButton.center.y -= 20
        continueButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        continueButton.alpha = 0.5
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: []) {
            self.continueButton.center.y += 20
            self.continueButton.transform = CGAffineTransform.identity
            self.continueButton.alpha = 1
        }
    }
    
    private func createRepeatPasswordTextField() {
        let TFframe = passwordTextField.frame
        repeatPasswordTextField.frame = CGRect(x: 0,
                                               y: (TFframe.origin.y + TFframe.size.height + 8),
                                               width: TFframe.width,
                                               height: TFframe.height)
        repeatPasswordTextField.placeholder = "Repeat password"
        repeatPasswordTextField.backgroundColor = .white
        repeatPasswordTextField.layer.cornerRadius = 5.0
        repeatPasswordTextField.font = UIFont.systemFont(ofSize: 14)
        repeatPasswordTextField.borderStyle = .roundedRect
        repeatPasswordTextField.contentVerticalAlignment = .center
    }
}
