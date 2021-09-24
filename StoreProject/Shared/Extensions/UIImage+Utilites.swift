//
//  UIImage+Utilites.swift
//  StoreProject
//
//  Created by Enas Abdallah on 23/09/2021.
//

import UIKit

extension UIImage {
    
    func resizeImage(newSize: CGSize) -> UIImage {
        // resize image
        UIGraphicsBeginImageContext(CGSize(width: newSize.width, height: newSize.height))
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        var newImage = UIGraphicsGetImageFromCurrentImageContext()
        newImage = newImage?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        UIGraphicsEndImageContext()
        return newImage!
    }
    
//    func convertBase64String() -> String {
//        // convert to base 64 string
//        let imageData:Data = self.compressedData()!
//        let imageBase64String = imageData.base64EncodedString(options: .lineLength64Characters)
//        return imageBase64String
//    }
    
    func maskRoundedImage(radius: CGFloat) -> UIImage {
        // make circle image
        let imageView: UIImageView = UIImageView(image: self)
        let layer = imageView.layer
        layer.masksToBounds = true
        layer.cornerRadius = radius
        UIGraphicsBeginImageContext(imageView.bounds.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return roundedImage!
    }
    
    func transform(withNewColor color: UIColor) -> UIImage {
        // trasform color of image
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        
        let context = UIGraphicsGetCurrentContext()!
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        context.setBlendMode(.normal)
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context.clip(to: rect, mask: cgImage!)
        
        color.setFill()
        context.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }

    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}


