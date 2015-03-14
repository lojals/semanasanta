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
    @IBOutlet weak var lblYear: UILabel!
    var conn:Connection!
    var primCol = UIColor.theme1()
    var secuCol = UIColor.theme2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "squairy_light")!)
        configBtn(btnViaCrusis)
        configBtn(btnWonders)
        btnWonders.tag = 1
        btnWonders.addTarget(self, action: Selector("goMonument:"), forControlEvents: UIControlEvents.TouchUpInside)
        btnViaCrusis.tag = 2
        btnViaCrusis.addTarget(self, action: Selector("goMonument:"), forControlEvents: UIControlEvents.TouchUpInside)
        lblLogo.textColor = primCol
        lblDesc.font = UIFont.lightFlatFontOfSize(13)
        lblYear.font = UIFont.lightFlatFontOfSize(10)
        conn = Connection()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
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
        pager.type = sender.tag
        pager.array = sender.tag==1 ? conn.getMonuments() : conn.getViaCrusis()
//        self.presentViewController(pager, animated: true, completion: nil)
        self.showViewController(pager, sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

