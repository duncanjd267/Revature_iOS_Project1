//
//  StoreViewController.swift
//  Project_1
//
//  Created by admin on 4/30/21.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var point: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var us = DBHelper.inst.getOneData(name : DBHelper.inst.getCurrentUser())
        point.text = "\(us.username!)'s points: \(us.score)"

        // Do any additional setup after loading the view.
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
