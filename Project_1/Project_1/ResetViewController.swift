//
//  ResetViewController.swift
//  Project_1
//
//  Created by admin on 4/26/21.
//

import UIKit

class ResetViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var password2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func changePassword(_ sender: Any) {
        
        if(password1.text == password2.text){
            
            let dic = ["username": username.text, "password":password1.text]
            DBHelper.inst
                .updateData(object: dic as! [String:String])
            var sb = UIStoryboard(name: "Main", bundle: nil)
            var wel = sb.instantiateViewController(withIdentifier: "Login") as! UIViewController
            self.present(wel, animated: true, completion: nil)        }
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
