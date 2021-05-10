
//
//  ViewController.swift
//  Project_1
//
//  Created by admin on 4/19/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchy: UISwitch!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    let ud = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getUserDefault()
       
    }
    
    func getUserDefault(){
       
        if ud.bool(forKey: "switch") == true {
            //state = 1
            Username.text = ud.string(forKey: "Username")!
            print(ud.string(forKey: "Username"))
            print(self.Username)
            Password.text = ud.string(forKey: "Password")
            switchy.isOn = ud.bool(forKey: "switch")
        }
    }

    
    @IBAction func signin(_ sender: Any) {
        let data = DBHelper.inst.getOneData(name: Username.text!)
        
        if DBHelper.dataCheck{
            
        print("", data.username!)
        
        if (data.username! == Username.text && data.password! == Password.text) {
            if switchy.isOn{
                ud.setValue(Username.text, forKeyPath: "Username")
                ud.setValue(Password.text, forKeyPath: "Password")
                ud.setValue(switchy.isOn, forKeyPath: "switch")
            } else {
                ud.removeObject(forKey: "Username")
                ud.removeObject(forKey: "Password")
                ud.removeObject(forKey: "switch")
            }
            DBHelper.inst.holdCurrentUser(name: Username.text!)
                var sb = UIStoryboard(name: "Main", bundle: nil)
                var wel = sb.instantiateViewController(withIdentifier: "Welcomer") as! UITabBarController
                self.present(wel, animated: true, completion: nil)
                
        }else{
        print("User or Password does not exist")
    }
            
        }
        else{
            print("User or Password does not exist")
        }
    }
    
    @IBAction func clearData(_ sender: Any) {
        DBHelper.inst.clearData()
    }
}
