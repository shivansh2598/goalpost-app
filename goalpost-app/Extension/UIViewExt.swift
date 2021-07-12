//
//  UIViewExt.swift
//  goalpost-app
//
//  Created by Shivansh Sinha on 12/07/21.
//

import UIKit

extension UIView {
    func bindToKeyboard() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillChange(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil) //Basically we create the context attached to this func as an observer for anykeyboard change. If it happens, the observer will call the below function
    }
    
    @objc func keyBoardWillChange(_ notification: NSNotification){
        let duration = notification.userInfo![UIResponder.keyboardAnimationDurationUserInfoKey] as! Double
        let curve = notification.userInfo![UIResponder.keyboardAnimationCurveUserInfoKey] as! UInt
        let startingFrame = (notification.userInfo![UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let endingFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        
        let deltaY = endingFrame.origin.y - startingFrame.origin.y
        debugPrint(deltaY)
        
        //function to animate a UIView element
        UIView.animateKeyframes(withDuration: duration, delay: 0.0, options: KeyframeAnimationOptions(rawValue: curve), animations: {
            self.frame.origin.y += deltaY
        }, completion: nil)
        
    }
}
