//
//  Extensions.swift
//  AnimasionSwift
//
//  Created by 渕一真 on 2021/04/20.
//

import UIKit

extension NSObject {
    public func delayForSeconds(delay: Double, completion: @escaping() -> ()) {
        //DispatchTime
        let timer = DispatchTime.now() + delay
        
        DispatchQueue.main.asyncAfter(deadline: timer) {
            completion()
        }
    }
}

extension UIViewController {
    //第一引数はenum等でリファクタできそう
    func segueToNextViewController(segueID: String, delay: Double) {
        delayForSeconds(delay: delay) {
            self.performSegue(withIdentifier: segueID, sender: nil)
        }
    }
}
