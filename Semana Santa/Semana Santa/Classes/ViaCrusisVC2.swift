//
//  ViaCrusisVC.swift
//  Semana Santa
//
//  Created by Jorge Raul Ovalle Zuleta on 3/9/15.
//  Copyright (c) 2015 Jorge Ovalle. All rights reserved.
//

import UIKit

class ViaCrusisVC2: GenericContentVC {
    var scroll:UIScrollView!
    
    var imgChurch:UIImageView!
    var lblTitle:UILabel!
    var lblDescription:UILabel!
    var lblsemiPray1:UILabel!
    var lblPray1:UILabel!
    var lblPray2:UILabel!
    var lblPray3:UILabel!
    var lblText3:UILabel!
    
    var _id:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scroll = UIScrollView(frame: self.view.frame)
        scroll.backgroundColor = UIColor.clearColor()
        scroll.maximumZoomScale = 10
        scroll.multipleTouchEnabled = false
        self.view.addSubview(scroll)
        
        lblTitle = UILabel(frame: CGRect(x: 15, y: 30, width: 290, height: 45))
        lblTitle.text = ((array.objectAtIndex(pageIndex))["TIT"]) as? String
        lblTitle.textColor = UIColor.theme2()
        lblTitle.textAlignment = NSTextAlignment.Center
        lblTitle.font = UIFont.boldFlatFontOfSize(45)
        scroll.addSubview(lblTitle)
        
        var txt1 = ((array.objectAtIndex(pageIndex))["ALIAS"]) as? String
        lblDescription = UILabel(frame: CGRect(x: 15, y: lblTitle.frame.maxY + 5, width: 290, height: heightForView(txt1!, font: UIFont.lightFlatFontOfSize(15), width: 290)))
        lblDescription.text = txt1
        lblDescription.textColor = UIColor.theme1()
        lblDescription.numberOfLines = 0
        lblDescription.textAlignment = NSTextAlignment.Center
        lblDescription.font = UIFont.lightFlatFontOfSize(15)
        scroll.addSubview(lblDescription)
        
        txt1 = ((array.objectAtIndex(pageIndex))["NAME"]) as? String
        lblPray1 = UILabel(frame: CGRect(x: 15, y: lblDescription.frame.maxY + 8, width: 290, height: heightForView(txt1!, font: UIFont.flatFontOfSize(16), width: 290)))
        lblPray1.text = txt1
        lblPray1.textColor = UIColor.themeComplement()
        lblPray1.numberOfLines = 0
        lblPray1.textAlignment = NSTextAlignment.Center
        lblPray1.font = UIFont.flatFontOfSize(16)
        scroll.addSubview(lblPray1)
        
        lblsemiPray1 = UILabel(frame: CGRect(x: 15, y: lblPray1.frame.maxY + 8, width: 290, height: 45))
        lblsemiPray1.text = "Te adoramos, oh Cristo, y te bendecimos. \n Pues por tu santa cruz redimiste al mundo."
        lblsemiPray1.textColor = UIColor.theme2()
        lblsemiPray1.numberOfLines = 0
        lblsemiPray1.textAlignment = NSTextAlignment.Left
        lblsemiPray1.font = UIFont.lightFlatFontOfSize(16)
        scroll.addSubview(lblsemiPray1)
        
        txt1 = ((array.objectAtIndex(pageIndex))["TEXT1"]) as? String
        lblPray2 = UILabel(frame: CGRect(x: 15, y: lblsemiPray1.frame.maxY + 8, width: 290, height: heightForView(txt1!, font: UIFont.flatFontOfSize(16), width: 290)))
        lblPray2.text = txt1
        lblPray2.textColor = UIColor.theme1()
        lblPray2.numberOfLines = 0
        lblPray2.textAlignment = NSTextAlignment.Left
        lblPray2.font = UIFont.flatFontOfSize(16)
        scroll.addSubview(lblPray2)
        
        txt1 = ((array.objectAtIndex(pageIndex))["PRAY1"]) as? String
        lblPray3 = UILabel(frame: CGRect(x: 15, y: lblPray2.frame.maxY + 10, width: 290, height: heightForView(txt1!, font: UIFont.flatFontOfSize(16), width: 290)))
        lblPray3.text = txt1
        lblPray3.textColor = UIColor.themeComplement()
        lblPray3.numberOfLines = 0
        lblPray3.textAlignment = NSTextAlignment.Center
        lblPray3.font = UIFont.flatFontOfSize(16)
        scroll.addSubview(lblPray3)
        
        
        txt1 = ((array.objectAtIndex(pageIndex))["TEXT2"]) as? String
        lblText3 = UILabel(frame: CGRect(x: 15, y: lblPray3.frame.maxY + 10, width: 290, height: heightForView(txt1!, font: UIFont.flatFontOfSize(16), width: 290)))
        lblText3.text = txt1
        lblText3.textColor = UIColor.theme1()
        lblText3.numberOfLines = 0
        lblText3.textAlignment = NSTextAlignment.Left
        lblText3.font = UIFont.flatFontOfSize(16)
        scroll.addSubview(lblText3)
        
        scroll.contentSize = CGSize(width: 320, height: lblText3.frame.maxY + 100)
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRectMake(0, 0, width, CGFloat.max))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.ByWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
}
