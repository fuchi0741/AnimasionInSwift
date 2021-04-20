//
//  BasicViewController.swift
//  AnimasionSwift
//
//  Created by 渕一真 on 2021/04/20.
//

import UIKit

final class BasicViewController: UIViewController {
    
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var logoImageView: UIImageView!
    @IBOutlet weak private var loadingLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateTitle()
        animateLogo()
    }
    
    private func setupUI() {
        titleLabel.alpha = 0
        logoImageView.alpha = 0
        loadingLabel.alpha = 0
    }
    
    private func animateTitle() {
        //1.5秒かけてクロージャ内が実行される 
        UIView.animate(withDuration: 1.5) {
            self.titleLabel.alpha = 1
            self.titleLabel.frame.origin.y -= 20
        }
    }
    
    private func animateLogo() {
        UIView.animate(withDuration: 1.5, delay: 0.75, options: [.curveEaseInOut]) {
            self.logoImageView.alpha = 1
            self.logoImageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        } completion: { (completed) in
            self.segueToNextViewController(segueID: Segues.toAuthVC, delay: 3.0)
            self.animateLoadingLabel()
        }
    }
    
    private func animateLoadingLabel() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat, .autoreverse]) {
            self.loadingLabel.alpha = 1
            self.loadingLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
    }
}
