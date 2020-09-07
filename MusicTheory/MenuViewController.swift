//
//  MenuViewController.swift
//  MusicTheory
//
//  Created by Cameron Mockabee on 9/6/20.
//  Copyright © 2020 Cameron Mockabee. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    
    @IBOutlet weak var IntervalButton: UIButton!
    @IBOutlet weak var KeyButton: UIButton!
    
    
    @IBAction func IntervalButtonPress(_ sender: Any) {
        performSegue(withIdentifier: "IntervalSegue", sender: nil)
    }
    
   
    @IBAction func KeyButtonPress(_ sender: Any) {
        performSegue(withIdentifier: "KeySegue", sender: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "IntervalSegue" {
            if let destinationVC = segue.destination as? IntervalViewController {
                // do something
            }
        } else if segue.identifier == "KeySegue" {
            if let destinationVC = segue.destination as? KeyViewController {
                // do something else
            }
        }
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
