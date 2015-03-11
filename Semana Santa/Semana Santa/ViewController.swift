//
//  ViewController.swift
//  Semana Santa
//
//  Created by Jorge Raul Ovalle Zuleta on 2/25/15.
//  Copyright (c) 2015 Jorge Ovalle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnViaCrusis: FUIButton!
    @IBOutlet weak var btnWonders: FUIButton!
    @IBOutlet weak var lblLogo: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var lblYear: UILabel!

    var primCol = UIColor.theme1()
    var secuCol = UIColor.theme2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "squairy_light")!)
        configBtn(btnViaCrusis)
        configBtn(btnWonders)
        btnWonders.addTarget(self, action: Selector("goMonument:"), forControlEvents: UIControlEvents.TouchUpInside)
        lblLogo.textColor = primCol
        lblDesc.font = UIFont.lightFlatFontOfSize(13)
        lblYear.font = UIFont.lightFlatFontOfSize(10)
        
        btnInfo.titleLabel?.font = UIFont.iconFontWithSize(20)
        btnInfo.setTitle(NSString.iconStringForEnum(FlatUIIcon.FUIInfoCircle) , forState: UIControlState.Normal)
        btnInfo.setTitleColor(primCol, forState: UIControlState.Normal)
    }
    
    func configBtn(sender:FUIButton){
        sender.buttonColor = primCol
        sender.shadowColor = secuCol
        sender.shadowHeight = 5.0
        sender.cornerRadius = 6.0
        sender.titleLabel?.font = UIFont.boldFlatFontOfSize(16)
        sender.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Normal)
        sender.setTitleColor(UIColor.cloudsColor(), forState: UIControlState.Highlighted)
    }

    func goMonument(sender:UIButton){
        var pager:PagerControllerViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageController") as PagerControllerViewController
        var conn = Connection()
        pager.array = conn.getMonuments() ?? NSMutableArray()
        self.presentViewController(pager, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "monument"{
            
        }
    }
    
}

