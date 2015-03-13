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
    var banner: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interstitial = GADInterstitial()
        self.interstitial.adUnitID = "ca-app-pub-6435289462042400/6155720104"
        var request = GADRequest()
        request.testDevices = ["c39c06782aa5c356ac868e82a758ae43"]
        interstitial.loadRequest(request)
        self.banner = GADBannerView(adSize: kGADAdSizeBanner)
        self.banner.frame.origin = CGPoint(x: 0, y: view.frame.maxY - 50)
        self.view.addSubview(self.banner)
        self.banner.adUnitID = "ca-app-pub-6435289462042400/8690384100"
        self.banner.rootViewController = self;
        self.banner.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
