//
//  UIStoryboard+Extension.swift
//  StoreProject
//
//  Created by Enas Abdallah on 23/09/2021.
//

import UIKit

extension UIStoryboard {
    class func instantiateInitialViewController(_ id: Storyboard) -> UIViewController {
        let story = UIStoryboard(name: id.rawValue, bundle: nil)
        return story.instantiateInitialViewController()!
    }
}

public enum Storyboard: String {
    case Main

    public func viewController<VC: UIViewController>(_ viewController: VC.Type) -> VC {
        guard
            let vc = UIStoryboard(name: self.rawValue, bundle: nil)
                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
        
        return vc
    }
    
    public func initialViewController() -> UIViewController {
        let story = UIStoryboard(name: self.rawValue, bundle: nil)
        guard let vc = story.instantiateInitialViewController() else { fatalError("\(self.rawValue) has no InitialViewController") }
        return vc
    }
}
