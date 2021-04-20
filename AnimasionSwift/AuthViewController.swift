//
//  AuthViewController.swift
//  AnimasionSwift
//
//  Created by 渕一真 on 2021/04/20.
//

import UIKit

final class AuthViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginSegmentControllerOutlet: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var textfieldContainerView: UIView!
    
    // TODO
    let repeatPasswordTextField = UITextField()
    
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
        
        // Todo: Fire initial animations
        animateTitleLabel()
        showContinueButton()
    }
    
    
    @IBAction func loginSegmentControllerValueChanged(_ sender: UISegmentedControl) {
        //TODO: enumを使用してマジックナンバーを削除
        if sender.selectedSegmentIndex == 1 {
            addTextfieldWithTransition()
            moveContinueButtonDown()
        } else {
            removeTextfieldWithTransition()
            moveContinueButtonUp()
        }
    }
    
    @IBAction func didTapContinueButton(_ sender: UIButton) {
        animateContinueButtonOnClick()
        //TODO: 画面遷移
    }
    
    func animateTitleLabel() {
        UIView.animate(withDuration: 2.0, delay: 0.25, usingSpringWithDamping: 0.6, initialSpringVelocity: 6, options: []) {
            self.titleLabel.alpha = 1
            self.titleLabel.frame.origin.y += 150
        }
    }
    
    func showContinueButton() {
        UIView.transition(with: self.continueButton, duration: 2.0, options: [.transitionCrossDissolve]) {
            self.continueButton.isHidden = false
        }
    }
    
    func addTextfieldWithTransition() {
        UIView.transition(with: self.textfieldContainerView, duration: 1.0, options: [.transitionCrossDissolve]) {
            self.textfieldContainerView.addSubview(self.repeatPasswordTextField)
        }
    }
    
    func removeTextfieldWithTransition() {
        UIView.transition(with: self.textfieldContainerView, duration: 0.5, options: [.transitionCrossDissolve]) {
            self.repeatPasswordTextField.removeFromSuperview()
        }
    }

    
    func moveContinueButtonDown() {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseInOut]) {
            self.continueButton.center.y += 25
        }
    }
    
    func moveContinueButtonUp() {
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [.curveEaseInOut]) {
            self.continueButton.center.y -= 25
        }
    }

    
    func animateContinueButtonOnClick() {
        continueButton.center.y -= 20
        continueButton.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        continueButton.alpha = 0.5
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.5, options: []) {
            self.continueButton.center.y += 20
            self.continueButton.transform = CGAffineTransform.identity
            self.continueButton.alpha = 1
        }
    }
    
    ///計算型プロパティにリファクタリング
    func createRepeatPasswordTextField() {
        repeatPasswordTextField.frame = CGRect(x: 0, y: (passwordTextField.frame.origin.y + passwordTextField.frame.size.height + 8), width: 225, height: 35)
        repeatPasswordTextField.placeholder = "Repeat password"
        repeatPasswordTextField.backgroundColor = .white
        repeatPasswordTextField.layer.cornerRadius = 5.0
        repeatPasswordTextField.font = UIFont.systemFont(ofSize: 14)
        repeatPasswordTextField.borderStyle = .roundedRect
        repeatPasswordTextField.contentVerticalAlignment = .center
    }
}
