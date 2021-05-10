//
//  WelcomeViewController.swift
//  Project_1
//
//  Created by admin on 4/22/21.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var NotiLablel: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Here")
        label.text = "Welcome " +  DBHelper.inst.current
        var user = DBHelper.inst.getOneData(name: DBHelper.inst.current)
        label2.text = DBHelper.inst.current + "'s Points: " + String(user.score)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func bikeButton(_ sender: Any) {
        var user = DBHelper.inst.getOneData(name: DBHelper.inst.current)
        if user.score < 500{
            NotiLablel.text = "Insufficient amount, please fill out more surveys, or purchase a different item"
        } else {
            user.score = user.score - 500
            label2.text = DBHelper.inst.current + "'s Points: " + String(user.score)
            NotiLablel.text = "Thank you for purchasing!"
            
        }
        
    }
    
    @IBAction func basketButton(_ sender: Any) {
        var user = DBHelper.inst.getOneData(name: DBHelper.inst.current)
        if user.score < 300{
            NotiLablel.text = "Insufficient amount, please fill out more surveys, or purchase a different item"
        } else {
            user.score = user.score - 300
            label2.text = DBHelper.inst.current + "'s Points: " + String(user.score)
            NotiLablel.text = "Thank you for purchasing!"        }
        
        
    }
    @IBAction func couponButton(_ sender: Any) {
        
        var user = DBHelper.inst.getOneData(name: DBHelper.inst.current)
        if user.score < 200{
            NotiLablel.text = "Insufficient amount, please fill out more surveys, or purchase a different item"
        } else {
            user.score = user.score - 200
            label2.text = DBHelper.inst.current + "'s Points: " + String(user.score)
            NotiLablel.text = "Thank you for purchasing!"
        }
    }
    @IBAction func breakfastButton(_ sender: Any) {
        
        var user = DBHelper.inst.getOneData(name: DBHelper.inst.current)
        if user.score < 100{
            NotiLablel.text = "Insufficient amount, please fill out more surveys, or purchase a different item"
        } else {
            user.score = user.score - 100
            label2.text = DBHelper.inst.current + "'s Points: " + String(user.score)
            NotiLablel.text = "Thank you for purchasing!"
            
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
