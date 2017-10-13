//
//  FirstViewController.swift
//  TabbarTop
//
//  Created by jayaraj on 02/05/17.
//  Copyright © 2017 sample. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var btnCreateAccount: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        btnCreateAccount?.layer.cornerRadius = btnCreateAccount!.bounds.height / 2
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
