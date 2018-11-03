//
//  WelcomeScreenViewController.swift
//  Stopwatch
//
//  Created by Alin Zdurlan on 06/10/2018.
//  Copyright © 2018 Alin Zdurlan. All rights reserved.
//

import UIKit

class WelcomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        makeStatusBarBlack()
    }

}
