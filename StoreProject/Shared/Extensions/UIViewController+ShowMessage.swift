//
//  UIViewController+ShowMessage.swift
//  StoreProject
//
//  Created by Enas Abdallah on 23/09/2021.
//

import UIKit

extension UIViewController {
    

    
    // Mark:- Alert Action
    func displayMyAlertMessage(userMessage:String, handler: @escaping (Bool) -> Void = { _ in }) {
        let myAlert = UIAlertController(title:"", message:userMessage, preferredStyle: UIAlertController.Style.alert);
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            handler(true)
        }
//        let cancel = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { action in
//            handler(false)
//
//        })
        myAlert.addAction(okAction)
       // myAlert.addAction(cancel)
        self.present(myAlert, animated:true, completion:nil);
    }
    
    
    func addBlurinng(){
        let blurEffect = (NSClassFromString("_UICustomBlurEffect") as! UIBlurEffect.Type).init()
        
        let blurView = UIVisualEffectView(frame: UIScreen.main.bounds)
        blurEffect.setValue(3, forKeyPath: "blurRadius")
        blurView.effect = blurEffect
        blurView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.insertSubview(blurView, at: 0)
    }
    
    
}
