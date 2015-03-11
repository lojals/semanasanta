//
//  BKColors.swift
//  Yo Intervengo
//
//  Created by Jorge Raul Ovalle Zuleta on 2/1/15.
//  Copyright (c) 2015 Olinguito. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    // MARK: - Utils
    func bd_componentsFromColor() -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat)
    {
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 0.0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return (r, g, b, a)
    }
    
    func bd_hexFromColor() -> String
    {
        var components = self.bd_componentsFromColor()
        // convert into integer
        var r: Int = Int(255.0 * components.red)
        var g: Int = Int(255.0 * components.green)
        var b: Int = Int(255.0 * components.blue)
        return String(NSString(format: "%02x%02x%02x", r, g, b))
    }
    
    // MARK: - Flat colors
    class func patternColor() -> UIColor{
        return UIColor(patternImage: UIImage(named: "squairy_light")!)
    }
    
    class func theme1() -> UIColor {
        return UIColor.wetAsphaltColor()
    }
    
    class func theme2() -> UIColor {
        return  UIColor.midnightBlueColor()
    }
    
    class func themeLight() -> UIColor {
        return  UIColor.asbestosColor()
    }
    
    class func themeComplement() -> UIColor {
        return  UIColor.pomegranateColor()
    }
    

    
   

    
}