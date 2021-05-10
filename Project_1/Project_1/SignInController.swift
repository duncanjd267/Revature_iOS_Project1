//
//  SignInController.swift
//  Project_1
//
//  Created by admin on 4/22/21.
//

import UIKit

class SignInController: UIViewController {

    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var warning: UILabel!
    @IBOutlet weak var Password_Again: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Save(_ sender: Any) {
        
        if Password.text == Password_Again.text {
            let dic = ["username" : Username.text, "password" : Password.text]
            DBHelper.inst.addData(object: dic as! [String:String])
            var sb = UIStoryboard(name: "Main", bundle: nil)
            var wel = sb.instantiateViewController(withIdentifier: "Login") as! UIViewController
            self.present(wel, animated: true, completion: nil)
        } else{
            warning.text = "Passwords did not match, try again"
            warning.backgroundColor = UIColor.white
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
