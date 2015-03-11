//
//  GenericViewController.swift
//  Semana Santa
//
//  Created by Jorge Raul Ovalle Zuleta on 3/10/15.
//  Copyright (c) 2015 Jorge Ovalle. All rights reserved.
//

import UIKit

class GenericViewController: UIViewController, GADInterstitialDelegate {

    var interstitial:GADInterstitial!
    @IBOutlet weak var banner: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interstitial = GADInterstitial()
        self.interstitial.adUnitID = "ca-app-pub-6435289462042400/6155720104"
        
        var request = GADRequest()
        request.testDevices = ["c39c06782aa5c356ac868e82a758ae43"]
        interstitial.loadRequest(request)
        
        self.banner.adUnitID = "ca-app-pub-6435289462042400/8690384100"
        self.banner.rootViewController = self;
        self.banner.loadRequest(request)
        
        /*var l = UILabel(frame: CGRect(x: 0, y: self.view.frame.height - 50, width: 320, height: 50))
        l.text = "Tap si amas al Señor"
        l.textColor = UIColor.whiteColor()
        l.textAlignment = NSTextAlignment.Center
        l.backgroundColor = UIColor.blackColor()
        l.userInteractionEnabled = false
        self.view.addSubview(l)*/
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
